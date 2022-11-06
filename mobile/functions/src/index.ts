import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp(functions.config().firebase);

interface Room {
  hostId: string;
  password?: string;
  createdAt: admin.firestore.Timestamp;
  playerIds: string[];
}

interface Etona {
  id: string;
  name?: string;
  godparentId?: string;
  order?: number;
  type: number; // 0: image, 1: name
}

export const startGame = functions
    .region("asia-northeast1")
    .firestore.document("/plays/{playId}")
    .onUpdate(async (snapshot) => {
      const getAfterData = snapshot.after.data();
      const room = getAfterData as Room;

      if (room.playerIds.length < 4) {
        return;
      }

      console.log("play game!");

      try {
        const currentPlayerIds = room.playerIds.slice(0, 4);

        const idList = [
          ...currentPlayerIds,
          ...currentPlayerIds,
          ...currentPlayerIds,
        ];
        const shuffleIds = shuffle(idList);
        const orderList = Array.from({length: 12}, (_, i) => i + 1);
        const shuffleOrders = shuffle(orderList);

        const etonas = Array.from({length: 12}, (_, i) => {
          return <Etona>{
            id: `etn${i+1}`,
            godparentId: shuffleIds[i],
            order: shuffleOrders[i],
            type: Math.floor(Math.random()*2),
          };
        });

        const db = admin.firestore();
        const batch = db.batch();

        etonas.forEach((etona)=> {
          const docRef = db.collection("plays").doc(snapshot.after.id)
              .collection("etonas").doc();
          batch.set(docRef, {
            id: etona.id,
            godparentId: etona.godparentId,
            order: etona.order,
            type: etona.type,
          });
        });

        await batch.commit();
      } catch (err) {
        console.log(`Error: ${JSON.stringify(err)}`);
        throw new functions.https.HttpsError("internal", "error");
      }


      // 問題の順番
      // 問題が絵か名前か
      // Etonaをplayerに4体ずつ分配
      // sessionsサブコレクション作る
      // etonasサブコレクション作る

    /* if (user.uid == null) {
      return;
    }

    try {
      await admin.firestore().collection("auth").doc(user.uid).delete();

      const { data, error } = await supabaseAdmin
        .from<Customer>("users")
        .select()
        .eq("id", user.uid)
        .single();

      if (data) {
        await updateCustomers(data, user);
      }

      if (error) {
        console.log(error);
        Error(error.message);
        return;
      }

      await admin.auth().deleteUser(user.uid);
      return;
    } catch (err) {
      console.log(`Error: ${JSON.stringify(err)}`);
      throw new functions.https.HttpsError("internal", "error");
    }*/
    });

const shuffle = <T>(array: T[]) => {
  const out = Array.from(array);
  for (let i = out.length - 1; i > 0; i--) {
    const r = Math.floor(Math.random() * (i + 1));
    const tmp = out[i];
    out[i] = out[r];
    out[r] = tmp;
  }
  return out;
};

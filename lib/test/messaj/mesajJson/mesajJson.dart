import 'dart:convert';

import 'package:azertexnolayn/test/messaj/mesajModel/mesaj_model.dart';

class AllMesaj {
  static List<TestMesaj>? mesajList({int mesajStatus=0}) {
     List<TestMesaj> items=[];
    const String jsonPath = """
   [
  {
    "id":1,
    "basliq": "Ut problem",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": null,
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-15 19:59:14",
    "timerStatus": 0,
    "mesajStatus": 1
  },
  {
    "id":2,
    "basliq": "Ut problem",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": null,
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-15 19:27:14",
    "timerStatus": 0,
    "mesajStatus": 1
  },
  {
    "id":3,
    "basliq": "Ut problem",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": null,
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-15 21:27:14",
    "timerStatus": 0,
    "mesajStatus": 1
  },
  {
    "id":4,
    "basliq": "Ut problem2",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-15 17:27:14",
    "timerStatus": 1,
    "mesajStatus": 2
  },
  {
    "id":5,
    "basliq": "Ut problem3",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-15 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 2
  },
  {
    "id":6,
    "basliq": "Ut problem4",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 1,
    "mesajStatus": 3
  },
  {
    "id":7,
    "basliq": "Ut problem5",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 3
  },
  {
    "id":8,
    "basliq": "Ut problem6",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 1,
    "mesajStatus": 4
  },
  {
    "id":9,
    "basliq": "Ut problem7",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 4
  },
  {
    "id":10,
    "basliq": "Ut problem8",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 1,
    "mesajStatus": 5
  },
  {
    "id":11,
    "basliq": "Ut problem9",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 5
  },
  {
    "id":12,
    "basliq": "Ut problem10",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 1,
    "mesajStatus": 6
  },
  {
    "id":13,
    "basliq": "Ut problem11",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 6
  },
    {
    "id":14,
    "basliq": "Ut problem12",
    "gonderen": "Ulvi Nebiyev",
    "kimler": [
      {
        "ad": "Turxna Ibrahimov"
      },
      {
        "ad": "Elgiz Cebrayilov"
      },
      {
        "ad": "Faiq Muradov"
      },
      {
        "ad": "Elnur Ilyasov"
      }
    ],
    "qebulEtdi": "Elgiz Cebrayilov",
    "tarix": "2021-05-25 16:45:15",
    "timer": "2021-09-12 17:27:14",
    "timerStatus": 2,
    "mesajStatus": 6
  }


]
    
    """;

    List<dynamic> jsonList = jsonDecode(jsonPath);
    items.clear();
    items =jsonList.map((e) => TestMesaj.fromJson(e)).toList();
for (var item in items) {
  print('MesajStatusuna bax: ${item.mesajStatus}   gelen int $mesajStatus');
}
        print(items.length);
         if (mesajStatus!=0) {
           return _howList(mesajStatus: mesajStatus,items: items);
         } 
         return items;
        
  }

  static List<TestMesaj>? _howList({int? mesajStatus, required List<TestMesaj> items}) {
    List<TestMesaj> list=[];
    list.clear();
    for (var item in items) {
      if (mesajStatus==item.mesajStatus) {
        list.add(item);
        
      }
    }
      return list;
   
  }
}

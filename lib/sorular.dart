class sorular{
  String baslik;
  int kacinciSoru;
  String icerik;

  sorular({required this.baslik, required this.kacinciSoru, required this.icerik});
}

final List<Map<String,Object>> sorularCevaplar = [
  {
    'soru' : "What is the big country than other ?",
    'cevaplar' : [
      {
        'text' : 'France','correct' : false,
        'text' : 'China','correct' : false,
        'text' : 'India','correct' : false,
        'text' : 'Usa','correct' : true,
      }
    ]
  }
];
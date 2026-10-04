import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ─── Chrome · koyu tema ─────────────────────────────────────────────
  /// En derin zemin. Kaydırılan içeriğin arkası, modal altı katman.
  static const darkSurface000 = Color(0xFF100D0A);

  /// Uygulamanın ana zemini. Her ekranın gövde arka planı.
  static const darkSurface100 = Color(0xFF16120E);

  /// Kartlar, paneller, liste satırları, alt sayfalar.
  static const darkSurface200 = Color(0xFF1F1A15);

  /// Girdi alanları, basılı satırlar, segmented control rayı.
  static const darkSurface300 = Color(0xFF2A231C);

  /// Menüler, tooltip'ler, popover'lar.
  static const darkSurfaceOverlay = Color(0xFF332B22);

  // ─── Chrome · açık tema ─────────────────────────────────────────────
  static const lightSurface000 = Color(0xFFF2EDE4);
  static const lightSurface100 = Color(0xFFFBF8F2);
  static const lightSurface200 = Color(0xFFFFFFFF);
  static const lightSurface300 = Color(0xFFF1EBE0);
  static const lightSurfaceOverlay = Color(0xFFFFFFFF);

  // ─── Mürekkep ───────────────────────────────────────────────────────
  /// Birincil metin ve ikonlar.
  static const darkInk = Color(0xFFF4EDE2);
  static const lightInk = Color(0xFF1C1711);

  /// İkincil metin: etiketler, açıklamalar, meta bilgi.
  static const darkInkMuted = Color(0xFFB8AB99);
  static const lightInkMuted = Color(0xFF554B40);

  /// Pasif metin ve placeholder. **Gövde metni için kullanılmaz.**
  static const darkInkSubtle = Color(0xFF9B8E7C);
  static const lightInkSubtle = Color(0xFF6F6354);

  // ─── Marka amberi ───────────────────────────────────────────────────
  /// Birincil buton dolgusu, aktif sekme, metronomun kuvvetli vuruşu,
  /// ilerleme çubuğu dolgusu. Bunların dışında amber kullanma.
  static const darkAccent = Color(0xFFD9A441);
  static const lightAccent = Color(0xFFB8831F);

  /// Amber dolguların basılı / üzerine gelme durumu.
  static const darkAccentHover = Color(0xFFEDBA5E);
  static const lightAccentHover = Color(0xFF9E6F16);

  /// Amber **metin** ve ikonlar. [darkAccent] metin olarak açık temada
  /// 4.5:1 tutmaz; metin için her zaman bu kullanılır.
  static const darkAccentText = Color(0xFFE8BC68);
  static const lightAccentText = Color(0xFF8A5F12);

  /// Amber içeriğin arkasındaki kısık zemin: seçili satır, aktif pratik
  /// bandı, ipucu kutusu.
  static const darkAccentWash = Color(0xFF2B2216);
  static const lightAccentWash = Color(0xFFF7ECD4);

  /// Amber kenarlıklar ve ayraçlar, metronomun henüz çalmamış vuruşları.
  static const darkAccentDim = Color(0xFF7A5C22);
  static const lightAccentDim = Color(0xFFDCBE7E);

  /// Amber dolgular üzerindeki metin. Her iki temada da koyu — amber
  /// ikisinde de açık bir renktir.
  static const onAccent = Color(0xFF1A1309);

  // ─── Durum renkleri · yalnızca iki tane ─────────────────────────────
  // İkiyle sınırlı olmasının sebebi amber: marka rengi sıcak bandın altın
  // ucunu tuttuğu için, sıcak tarafta amberden ve birbirinden yeterince
  // ayrışan ikinci bir durum rengi çıkmıyor. Birbirinden ayrılamayan iki
  // renk, tek renkten kötüdür.

  /// Doğru olan her şey: akortta, doğru nota, tamamlanmış ödev.
  static const darkSignalTrue = Color(0xFF8CC271);
  static const lightSignalTrue = Color(0xFF3F7A2E);

  /// Doğru olmayan her şey: pes, tiz, yanlış nota, atlanan ölçü, başarısız
  /// yükleme, geri alınamaz işlemin butonu.
  ///
  /// **Renk doğruluğu söyler, yönü söylemez.** Pes ve tiz aynı rengi alır;
  /// yön ibrenin yerinde, işaretli sayıda (`−12` / `+15`) ve kelimenin
  /// yanındaki üçgende okunur. Üçü her zaman birlikte bulunur.
  static const darkSignalOff = Color(0xFFEA6F50);
  static const lightSignalOff = Color(0xFFB23A1C);

  // ─── Kenarlıklar ve odak ────────────────────────────────────────────
  /// Saç teli ayraçlar, kart kenarları, tablo çizgileri. Anlam taşımaz.
  static const darkBorder = Color(0xFF2E2720);
  static const lightBorder = Color(0xFFE6DDCD);

  /// Bir şeyin kontrol olduğunu söyleyen sınır: girdi kenarı, segmented
  /// control. 3:1 tutar.
  static const darkBorderStrong = Color(0xFF82705B);
  static const lightBorderStrong = Color(0xFF8F7E62);

  /// Chrome yüzeylerinde klavye odağı: 2px kalınlık, 2px offset.
  static const darkFocusRing = Color(0xFFF2C46A);
  static const lightFocusRing = Color(0xFF8A5F12);

  // ─── Paper · nota sayfası, iki temada da açık ───────────────────────
  /// Nota sayfasının yüzeyi.
  static const darkPaper = Color(0xFFF0E8D9);
  static const lightPaper = Color(0xFFFBF7EF);

  /// Kâğıt üzerindeki tüm gravür işaretleri: nota başları, saplar,
  /// anahtarlar, es'ler.
  static const darkPaperInk = Color(0xFF1B1610);
  static const lightPaperInk = Color(0xFF14100B);

  /// Porte çizgileri, ölçü çizgileri, ek çizgiler, tablatura çizgileri.
  static const darkPaperLine = Color(0xFF8C7C66);
  static const lightPaperLine = Color(0xFF9C8C74);

  /// Parmak numaraları, ölçü numaraları, tablatura rakamları.
  static const darkPaperMuted = Color(0xFF6B5C46);
  static const lightPaperMuted = Color(0xFF6F6050);

  /// O an tınlayan veya seçili ölçünün zemini. Üstündeki nota
  /// `paperInk` kalır, rengi değişmez.
  static const darkPaperAccent = Color(0xFFE8CE93);
  static const lightPaperAccent = Color(0xFFF2DFAE);

  /// Kâğıt üzerindeki odak halkası — [darkFocusRing] kâğıtta kaybolduğu
  /// için ayrı token. Her iki temada aynı.
  static const focusRingPaper = Color(0xFF6B4E12);

  // ─── Grafik serileri · sabit sıra, döngüye sokulmaz ─────────────────
  // Renk seriyi takip eder, sırasını değil: bir filtre seri sayısını
  // değiştirdiğinde kalanlar yeniden boyanmaz. Dörtten fazlası varsa kırp,
  // katla veya küçük çoklu kullan — beşinci bir renk üretme.

  static const darkDataPractice = Color(0xFFBF860C);
  static const lightDataPractice = Color(0xFF8D6100);

  static const darkDataTempo = Color(0xFF4391CE);
  static const lightDataTempo = Color(0xFF066FB0);

  static const darkDataAccuracy = Color(0xFF4CA05C);
  static const lightDataAccuracy = Color(0xFF1B7F37);

  static const darkDataSessions = Color(0xFFA173C7);
  static const lightDataSessions = Color(0xFF824DAC);

  /// Yalnızca ızgara çizgileri. Eksen etiketleri `inkSubtle` kullanır.
  static const darkDataGrid = Color(0xFF332C24);
  static const lightDataGrid = Color(0xFFEDE4D4);

  // ─── Karartma ve gölge ──────────────────────────────────────────────
  /// Modal ve alt sayfaların arkasındaki karartma katmanı.
  static const darkScrim = Color(0xCC0A0806);
  static const lightScrim = Color(0xA61C1711);

  // Gölge seyrek kullanılır: koyu temada derinliği gölge değil yüzey
  // basamağı yapar (surface100 → surface200 → surface300).
  static const darkShadowRaised = Color(0x59000000);
  static const lightShadowRaised = Color(0x141C1711);
  static const darkShadowOverlay = Color(0x73000000);
  static const lightShadowOverlay = Color(0x1F1C1711);
}

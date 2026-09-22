#----------------------------------------------------------#
#
#       L06 — Když prediktor není číslo
#       Od rozdílu průměrů k analýze rozptylu
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava: projekt, skript a data -----
#----------------------------------------------------------#

# Projekt v RStudiu je hlavní složka pro jednu práci. Soubor
# .Rproj pomáhá tuto složku znovu otevřít. Skript a data jsou
# samostatné soubory uvnitř projektu. Uložení skriptu neuloží
# objekty v aktuální relaci R.
#
# V RStudiu zvolte File > New Project > New Directory >
# New Project. Jako Directory name zadejte L06_praktikum.
# V Create project as subdirectory of vyberte složku, kde
# chcete práci uchovat, a potvrďte Create Project.
# Název otevřeného projektu uvidíte vpravo nahoře.
#
# V panelu Files klikněte New Folder, pojmenujte ji data
# a otevřete ji. Stáhněte soubor:
# https://cuni-natur-biostatistics.github.io/L06/current/data/palmer_penguins.csv
# Uložte jej jako palmer_penguins.csv do složky data.
# Kliknutím na .. v panelu Files se vraťte do hlavní složky.
# Stáhněte skript:
# https://cuni-natur-biostatistics.github.io/L06/current/code/cviceni.R
# Uložte jej do hlavní složky projektu jako cviceni.R.
# V RStudiu zvolte File > Open File a stažený skript otevřete.
#
# L06_praktikum/
#   L06_praktikum.Rproj
#   cviceni.R
#   data/
#     palmer_penguins.csv
#
# Skript spouštějte shora dolů. Jeden příkaz spusťte kurzorem
# na jeho řádku pomocí Ctrl + Enter. U víceřádkového příkazu
# označte všechny jeho řádky a stiskněte Ctrl + Enter.
# Výsledky se ukážou v Console, grafy v Plots. Řádky začínající
# znakem # jsou komentáře a R je nespouští.
# Pod „Vaše řešení“ pište příkazy bez #; slovní odpovědi pište
# na komentářové řádky začínající #. Kopii průběžně ukládejte
# pomocí Ctrl + S. Nápovědy čtěte postupně.
#
# Hlavní úlohy L06-U01 až L06-U08 tvoří společnou trasu.
# Pozdější úlohy používají data_tucnaci z U01, mod_dva_druhy
# z U02 a mod_tri_druhy z U05. Úlohy navíc jsou dobrovolné.
# Projekt znovu otevřete dvojklikem na soubor .Rproj.
# Restart R smaže objekty z aktuální relace, ale uložený
# skript a CSV zůstanou na disku. Po restartu spusťte svůj
# uložený skript znovu shora dolů.


#--------------------------------------------------#
## Výsledky učení a návaznost na L05 -----
#--------------------------------------------------#

# Po praktiku dokážete fitovat stejný lineární model pro dvě
# i tři skupiny, číst jeho koeficienty vůči referenční skupině,
# propojit dvouskupinový t-test a ANOVA s otázkami o modelu,
# vyložit navazující párová porovnání a napsat opatrný závěr
# o rozdílech v tělesné hmotnosti tučňáků.
#
# V L05 jste četli odhad efektu, interval spolehlivosti,
# t-statistiku a p-hodnotu. Pokud je znáte, připomenutí
# přeskočte:
# - odhad říká, jak velký rozdíl ukazují data v původních
#   jednotkách; interval vyjadřuje nejistotu odhadu;
# - p-hodnota popisuje, jak neobvyklá by byla data podobná
#   našim za platnosti přesně vyřčené nulové hypotézy;
# - residuum je pozorovaná hodnota minus odhad modelu.


#--------------------------------------------------#
## Kontrola souboru -----
#--------------------------------------------------#

# Cesta začíná v hlavní složce otevřeného projektu.
# Kontrola nic nestahuje ani nemění ve vašem počítači.
soubor_tucnaci <- "data/palmer_penguins.csv"

if (
  !file.exists(soubor_tucnaci)) {
  stop(
    "Soubor data/palmer_penguins.csv nebyl nalezen. Otevřete projekt L06_praktikum a zkontrolujte název i umístění CSV ve složce data.",
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#


#--------------------------------------------------#
## Které hmotnosti máme k dispozici? -----
#--------------------------------------------------#

# Připravená tabulka vychází z veřejných dat Palmer Penguins.
# Každý řádek je jedno měření tučňáka ze souostroví Palmer
# v letech 2007–2009. Sloupec druh určuje skupinu,
# hmotnost_tela_g je tělesná hmotnost v gramech.
# Původ a přípravu souboru popisují skripta a data/README.md.
#
# Vzor z L05: název objektu a cestu nahraďte v U01.
# data_nazev <- read.csv(file = cesta_k_souboru)
#
# stripchart() nakreslí jednotlivé hodnoty pro každou
# skupinu. Argument method = "jitter" posune překrývající
# se body mírně do stran; vertical = TRUE dá hmotnost na
# svislou osu. Přehled začněte až po odstranění chybějících
# hmotností. Funkce factor() nastaví pořadí druhů v grafu
# a současně první, referenční úroveň pro model.


#----------------------------------------#
### Úloha | L06-U01 -----
#----------------------------------------#

# Zadání: Načtěte soubor_tucnaci pomocí read.csv()
# do data_tucnaci_surova. Zjistěte počet řádků, počty
# druhů a počet chybějících hodnot hmotnost_tela_g.
# Do data_tucnaci uložte pouze řádky se změřenou
# hmotností. Sloupec druh převeďte na faktor s pořadím
# c("Adelie", "Chinstrap", "Gentoo") a ověřte počty
# druhů. Funkcí stripchart() nakreslete jednotlivé
# hmotnosti podle druhu, s popisem druhů a osy v gramech.
# Která proměnná je odezva a která prediktor? Co
# představuje jeden bod a jeden řádek tabulky?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Z 344 měření dvě nemají uvedenou
# hmotnost; po jejich odstranění zbývá 342 řádků:
# 151 Adélie, 68 Chinstrap a 123 Gentoo. Jeden bod
# znamená měření jednoho tučňáka, nikoli průměr druhu.
# Nápověda 1: Nejprve prohlédněte původní tabulku;
# vyřazujte jen řádky bez odezvy, nikoli řádky s jinou
# chybějící položkou, kterou zde nemodelujete.
# Nápověda 2: Použijte nrow(), table() a sum(is.na()).
# Řádky ponechte pomocí !is.na() ve výběru data[radky, ].
# Po factor() použijte stripchart() s formulí
# hmotnost_tela_g ~ druh, data = data_tucnaci,
# method = "jitter" a vertical = TRUE.


#--------------------------------------------------#
## Dva druhy v jednom modelu -----
#--------------------------------------------------#

# V L03–L05 byl na pravé straně formule číselný prediktor.
# Nyní tam bude druh. Model stále odhaduje jednu hodnotu
# pro každé pozorování; pro stejný druh je to stejný průměr.
#
# Nejprve ponecháme Adélie a Gentoo. Výběr řádků ze
# třískupinového faktoru může uchovat nepoužitou úroveň
# Chinstrap. Funkce droplevels() ji odstraní, aby model
# skutečně obsahoval jen dva druhy. První úroveň faktoru
# Adélie je referenční skupina. Intercept je její průměr;
# koeficient druhGentoo je Gentoo minus Adélie.
#
# Krátký umělý příklad se dvěma skupinami A a B:
data_ukazka <-
  data.frame(
    skupina = factor(
      x = c("A", "A", "B", "B"),
      levels = c("A", "B")
    ),
    hmotnost_g = c(3000, 3200, 4000, 4200)
  )

mod_ukazka <-
  lm(
    formula = hmotnost_g ~ skupina,
    data = data_ukazka
  )

coef(object = mod_ukazka)
# Intercept je 3100 g pro A; koeficient skupinaB
# je rozdíl 1000 g mezi průměry B a A.


#----------------------------------------#
### Úloha | L06-U02 -----
#----------------------------------------#

# Zadání: Z data_tucnaci vytvořte data_dva_druhy
# s řádky druhů Adelie a Gentoo. Z jeho sloupce druh
# odstraňte nevyužitou úroveň pomocí droplevels()
# a pomocí levels() ověřte, že referencí je Adelie.
# Fitujte mod_dva_druhy pomocí lm(), kde odezvou je
# hmotnost_tela_g a prediktorem druh. Vypište coef()
# a obě čísla vysvětlete v gramech. Kolik gramů je
# odhadnutý rozdíl Gentoo minus Adélie?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Model má 274 měření. Intercept
# je asi 3700,7 g, průměr Adélie; koeficient druhGentoo
# je asi +1375,4 g, rozdíl Gentoo minus Adélie.
# Nápověda 1: Výběr řádků vymezí dva druhy, ale
# pořadí faktoru určí, který zůstane referencí.
# Nápověda 2: Podmínku pro řádky vytvořte operátorem
# %in% a výběrem data_tucnaci[radky, ]. Pak nastavte
# data_dva_druhy$druh pomocí droplevels() a ve formuli
# lm() dejte hmotnost_tela_g vlevo a druh vpravo.


#--------------------------------------------------#
## Co znamenají odhady a residua? -----
#--------------------------------------------------#

# Z L04 známe fitted() jako odhadnuté hodnoty a resid()
# jako rozdíly mezi měřením a odhadem. V tomto modelu
# dostane každý tučňák téhož druhu stejný odhad. Gentoo
# průměr získáme přičtením rozdílu ke skupině Adélie.
# Funkce confint() vrací 95% intervaly pro koeficienty.
# Pro druhový rozdíl sledujte řádek druhGentoo, nikoli
# řádek interceptu.


#----------------------------------------#
### Úloha | L06-U03 -----
#----------------------------------------#

# Zadání: Z coef(mod_dva_druhy) dopočítejte
# odhadnutý průměr Gentoo jako intercept plus
# koeficient druhGentoo. Porovnejte jej se skutečným
# průměrem hmotnosti Gentoo v data_dva_druhy.
# Zobrazte prvních šest hodnot fitted(mod_dva_druhy)
# a resid(mod_dva_druhy) a vysvětlete jedno residuum.
# Z confint(mod_dva_druhy) přečtěte 95% interval
# pro rozdíl Gentoo minus Adélie. Co tento interval
# připouští o velikosti rozdílu v gramech?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Gentoo má odhadnutý průměr
# asi 5076,0 g, shodný s výběrovým průměrem.
# Residuum je hmotnost jedince minus průměr jeho druhu.
# Interval rozdílu je přibližně 1260,7–1490,0 g;
# nula v něm není.
# Nápověda 1: Stejný model dodá dva skupinové průměry.
# Odhad každého jednotlivce patří k jeho druhu;
# interval vyjadřuje nejistotu rozdílu těchto průměrů.
# Nápověda 2: Sečtěte dva členy coef(). Průměr Gentoo
# ověřte pomocí mean() na hmotnostech řádků s druhem
# Gentoo. Pro první hodnoty použijte head(fitted())
# a head(resid()); interval je v řádku druhGentoo.




#--------------------------------------------------#
## Jak souvisí model s dvouvýběrovým t-testem? -----
#--------------------------------------------------#

# V L05 jsme testovali nulový sklon přímky. Zde testujeme
# H0: skutečný rozdíl průměrů Gentoo minus Adélie je 0 g.
# Řádek druhGentoo v summary(mod_dva_druhy) obsahuje
# odhad, standardní chybu, t-statistiku a p-hodnotu.
# Dvouvýběrový t-test se stejným předpokladem společného
# rozptylu položí tutéž otázku. U t.test() proto výslovně
# nastavíme var.equal = TRUE. Bez tohoto argumentu používá
# R Welchův test; jeho čísla se mohou lišit od lm().
# Pořadí skupin v t.test() určuje znaménko rozdílu:
# pro Gentoo minus Adélie patří Gentoo do x a Adélie do y.


#----------------------------------------#
### Úloha | L06-U04 -----
#----------------------------------------#

# Zadání: Zobrazte summary(mod_dva_druhy) a v řádku
# druhGentoo určete odhad rozdílu, t a p-hodnotu.
# Residuální stupně volnosti najděte pod tabulkou. Potom pomocí t.test() porovnejte
# hmotnosti Gentoo jako x a Adélie jako y z
# data_dva_druhy, s var.equal = TRUE. Porovnejte směr
# rozdílu, t, stupně volnosti, p-hodnotu a 95% interval
# s koeficientem modelu. Vysvětlete, co přesně testují;
# znamená velmi malá p-hodnota velký biologický rozdíl?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Oba postupy dávají přibližně
# +1375,4 g, t = 23,61, df = 272, p kolem 8,03e-68
# a interval 1260,7–1490,0 g. Jde o stejnou nulovou
# otázku za stejných předpokladů; velikost rozdílu
# je nutné posoudit v gramech a biologickém kontextu.
# Nápověda 1: Porovnávejte stejný rozdíl ve stejném
# směru a se stejným předpokladem o rozptylu skupin.
# Nápověda 2: V t.test() vyberte x pomocí podmínky
# druh == "Gentoo", y pomocí druh == "Adelie" a
# přidejte var.equal = TRUE. V summary() sledujte
# řádek druhGentoo, ne p-hodnotu interceptu.


#--------------------------------------------------#
## Třetí druh, stejná formule -----
#--------------------------------------------------#

# Přidáme Chinstrap. U tří úrovní faktoru má model
# jeden referenční průměr a dva rozdíly od Adélie.
# Koeficienty přímo neukazují rozdíl Gentoo minus
# Chinstrap. Ani p-hodnota jednoho koeficientu není
# celkový test rovnosti všech tří průměrů.


#----------------------------------------#
### Úloha | L06-U05 -----
#----------------------------------------#

# Zadání: Z úplných data_tucnaci z U01 fitujte model
# mod_tri_druhy se stejnou formulí hmotnost_tela_g ~ druh.
# Vypište levels(data_tucnaci$druh), coef(mod_tri_druhy)
# a confint(mod_tri_druhy). Vysvětlete všechny tři
# koeficienty v gramech. Z nich spočtěte odhadnutý
# průměr Chinstrap a Gentoo. Který druh je reference
# a proč tu nenajdete přímý koeficient Gentoo minus
# Chinstrap?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Adélie asi 3700,7 g; Chinstrap
# minus Adélie asi +32,4 g, takže Chinstrap asi 3733,1 g;
# Gentoo minus Adélie asi +1375,4 g, takže Gentoo
# asi 5076,0 g. Oba rozdílové koeficienty mají
# společnou referenci Adélie.
# Nápověda 1: Formule se nemění. Počet rozdílových
# koeficientů odpovídá počtu dalších druhů vůči referenci.
# Nápověda 2: Použijte lm() jako v U02, ale data =
# data_tucnaci. Ke koeficientu (Intercept) přičtěte
# postupně druhChinstrap a druhGentoo.


#--------------------------------------------------#
## Jedna celková otázka o třech druzích -----
#--------------------------------------------------#

# Analýza rozptylu (ANOVA) položí modelu jinou otázku:
# H0 říká, že všechny tři skutečné skupinové průměry
# jsou stejné. F-statistika porovnává rozdíly mezi
# skupinami s variabilitou jedinců uvnitř skupin.
# Funkce anova(mod_tri_druhy) zobrazí jeden řádek druh
# pro celkový test a další řádek Residuals.


#----------------------------------------#
### Úloha | L06-U06 -----
#----------------------------------------#

# Zadání: Zobrazte anova(mod_tri_druhy). Zapište
# H0 celkového testu a z řádku druh opište F-statistiku,
# její stupně volnosti z řádků druh a Residuals a
# p-hodnotu. Co výsledek říká o třech průměrech?
# Proč z něj samotného nelze tvrdit, že se liší
# každá konkrétní dvojice, ani vyčíst rozdíl v gramech?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: H0: všechny tři průměry jsou
# stejné; F(2, 339) asi 343,63 a p < 2,2e-16.
# Data jsou s H0 obtížně slučitelná. Celkový test
# neurčuje, která dvojice se liší, a F nemá jednotku gram.
# Nápověda 1: Rozlišujte jednu otázku o všech skupinách
# od koeficientů, které srovnávají skupiny s Adélií.
# Nápověda 2: V tabulce anova() hledejte F value a
# Pr(>F) v řádku druh; Df jsou 2 pro druh a 339 pro
# Residuals. Rozdíly v gramech jsou jiné odhady.


#--------------------------------------------------#
## Které dvojice se liší? -----
#--------------------------------------------------#

# Po celkovém testu se zeptáme na konkrétní dvojice.
# Funkce emmeans::emmeans() získá ze stejného modelu
# odhadnuté průměry druhů. Funkce emmeans::contrast()
# s method = "revpairwise" vytvoří tři rozdíly v pořadí
# Chinstrap minus Adélie, Gentoo minus Adélie a Gentoo
# minus Chinstrap. Argument adjust = "tukey" zohlední,
# že se současně díváme na všechny tři dvojice.
# Funkce summary() s infer = c(TRUE, TRUE) ukáže
# také simultánní intervaly a upravené p-hodnoty.
# To jsou intervaly rozdílů, nikoli intervaly
# samostatných druhových průměrů.
#
# Balíček emmeans je potřeba pouze pro tuto část.
# Pokud chybí, spusťte následující komentovaný příkaz
# samostatně v Console a potom pokračujte odtud:
# install.packages("emmeans")

if (
  !requireNamespace("emmeans", quietly = TRUE)) {
  stop(
    "Chybí balíček emmeans. Spusťte v Console install.packages('emmeans') a potom pokračujte v tomto oddílu.",
    call. = FALSE
  )
}


#----------------------------------------#
### Úloha | L06-U07 -----
#----------------------------------------#

# Zadání: Z mod_tri_druhy vytvořte prumery_druhu
# pomocí emmeans::emmeans() pro druh. Potom z nich
# vytvořte post_hoc_druhy funkcí emmeans::contrast()
# s method = "revpairwise" a adjust = "tukey".
# Zobrazte summary(post_hoc_druhy, infer = c(TRUE, TRUE)).
# U všech tří dvojic uveďte směr a přibližný rozdíl
# v gramech. Který simultánní 95% interval obsahuje
# nulu? Co lze a nelze říci o této dvojici?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Chinstrap minus Adélie asi
# +32,4 g má interval přibližně −127 až 191 g;
# obsahuje nulu, a data proto nerozlišují tento malý
# rozdíl od nuly. Gentoo minus Adélie asi +1375,4 g
# a Gentoo minus Chinstrap asi +1342,9 g mají kladné
# simultánní intervaly. Interval obsahující nulu
# nedokazuje totožnost průměrů.
# Nápověda 1: Průměry jsou mezikrok; otázka o dvojicích
# potřebuje rozdíly průměrů a společnou úpravu nejistoty.
# Nápověda 2: V emmeans::emmeans() nastavte object =
# mod_tri_druhy a specs = ~ druh. Výsledný objekt dejte
# do object = v emmeans::contrast(); nastavte method =
# "revpairwise" a adjust = "tukey". V summary() použijte
# infer = c(TRUE, TRUE) pro intervaly i testy.




#--------------------------------------------------#
## Co lze říci o tučňácích? -----
#--------------------------------------------------#

# Stejně jako u přímky je potřeba zkontrolovat residua.
# V grafu residuí proti odhadnutým hodnotám čekejte
# tři svislé pásy, protože model odhaduje tři průměry;
# samy o sobě nejsou chybou. Ptejte se na nápadně
# rozdílný rozptyl nebo vzdálené body. Q–Q graf
# pomáhá posoudit tvar residuí. Grafy samy neprokážou
# nezávislost měření. Druh souvisí také s ostrovem;
# hmotnost se může lišit i podle zaznamenaného pohlaví.
# Tyto další souvislosti jednoprediktorový model neoddělí.


#----------------------------------------#
### Úloha | L06-U08 -----
#----------------------------------------#

# Zadání: Pro mod_tri_druhy nakreslete residua proti
# fitted hodnotám s popsanými osami v gramech a čárou
# v nule. Samostatně vytvořte Q–Q graf residuí pomocí
# qqnorm() a přidejte qqline(). Popište, co v grafech
# vidíte a co z nich o nezávislosti nezjistíte.
# Potom napište 4–6 vět pro biologa: biologická otázka
# a jednotka měření; tři druhové průměry a dva největší
# rozdíly v gramech; nejistota z intervalů; celková
# otázka ANOVA a závěr o třech párech; alespoň dvě
# omezení observačních dat. Netvrďte, že druh sám
# změnu hmotnosti způsobil.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Graf ukáže tři svislé pásy;
# Q–Q body přibližně sledují přímku s menšími odchylkami.
# Závěr odliší Gentoo od obou dalších druhů asi o
# 1,34–1,38 kg, ale neprohlásí Adélii a Chinstrap
# za shodné. Zmíní, že druh a ostrov jsou v souboru
# propojené a pohlaví může souviset s hmotností.
# Nápověda 1: Vraťte se od p-hodnot k velikostem
# rozdílů a intervalům. Kontrola modelu pomáhá závěr
# omezit, ale nezmění observační data v experiment.
# Nápověda 2: Do plot() dejte fitted(mod_tri_druhy)
# a resid(mod_tri_druhy), pak abline(h = 0, lty = 2).
# Samostatně použijte qqnorm(resid(mod_tri_druhy))
# a qqline(resid(mod_tri_druhy)). Pro text navazujte
# na U01, U05, U06 a U07.


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Tyto úlohy jsou dobrovolné. Vyberte si jednu nebo
# několik; nejsou podmínkou dokončení společné trasy.


#----------------------------------------#
### Úloha navíc | L06-N01 -----
#----------------------------------------#

# Zadání: Vytvořte kopii data_tucnaci s názvem
# data_jina_reference. Funkcí relevel() nastavte Gentoo
# jako první, referenční úroveň sloupce druh. Fitujte
# mod_jina_reference se stejnou formulí jako v U05.
# Porovnejte coef(mod_jina_reference) s U05 a pro
# všechny tři druhy porovnejte fitted průměry.
# Změnila se biologická data nebo jen způsob zápisu?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Intercept bude asi 5076,0 g;
# rozdíly Adélie a Chinstrap vůči Gentoo budou záporné.
# Fitted průměry a data se nezmění.
# Nápověda 1: Reference určuje nulu pro koeficienty,
# ale nemění měření ani průměry skupin.
# Nápověda 2: Do relevel() dejte sloupec druh a
# ref = "Gentoo"; potom znovu použijte lm() a coef().


#----------------------------------------#
### Úloha navíc | L06-N02 -----
#----------------------------------------#

# Zadání: Z výsledku summary(post_hoc_druhy,
# infer = c(TRUE, TRUE)) v U07 vyberte řádek
# Chinstrap - Adelie. Přečtěte odhad, simultánní
# interval a upravenou p-hodnotu. Napište dvě věty:
# co data připouštějí a proč interval obsahující nulu
# nedokazuje, že skutečné průměry jsou přesně stejné.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odhad asi +32,4 g, interval
# asi −127 až 191 g, upravené p asi 0,881.
# Data připouštějí malé rozdíly v obou směrech.
# Nápověda 1: Interval ukazuje více hodnot slučitelných
# s daty; jedna z nich je nula.
# Nápověda 2: V příslušném řádku čtěte estimate,
# lower.CL, upper.CL a p.value. Zahrnutí nuly znamená
# nerozlišený rozdíl, nikoli důkaz rovnosti.


#----------------------------------------#
### Úloha navíc | L06-N03 -----
#----------------------------------------#

# Zadání: V data_tucnaci vypočítejte pro každý druh
# směrodatnou odchylku hmotnost_tela_g. Porovnejte
# nejvyšší a nejnižší hodnotu s rozdíly průměrů z U05.
# Proč samotná F-statistika z U06 neříká, o kolik gramů
# se druhy liší?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: SD jsou přibližně 459 g pro
# Adélii, 384 g pro Chinstrap a 504 g pro Gentoo.
# F je poměr variabilit bez jednotky gram.
# Nápověda 1: Rozdíly průměrů popisují polohu skupin;
# SD popisuje rozptyl jedinců uvnitř každé skupiny.
# Nápověda 2: Použijte tapply() se sloupcem hmotnosti,
# faktorem druh a funkcí sd; F je v tabulce anova().


#----------------------------------------#
### Úloha navíc | L06-N04 -----
#----------------------------------------#

# Zadání: Z data_tucnaci vytvořte tabulku počtů
# kombinací druh a ostrov. Dále zjistěte počet
# chybějících hodnot pohlavi u každého druhu.
# Co tyto informace znamenají pro větu „druh
# způsobuje rozdíl hmotnosti“? Nefitujte další model.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Chinstrap je zde jen na Dream,
# Gentoo jen na Biscoe, Adélie na všech třech ostrovech.
# Pohlaví není zaznamenáno pro všechny jedince.
# Samotné srovnání druhů neoddělí jiné souvislosti.
# Nápověda 1: Nejprve zjistěte, zda jsou druhy na
# ostrovech vůbec zastoupeny společně.
# Nápověda 2: Použijte table() pro druh a ostrov;
# pro chybějící pohlaví použijte tapply() s is.na()
# a součtem TRUE hodnot v každém druhu.


#----------------------------------------------------------#
# Co si odnést -----
#----------------------------------------------------------#

# Stejný lm() umí číselný i kategoriální prediktor.
# U kategoriálního prediktoru je intercept průměr
# reference a další koeficienty rozdíly vůči ní.
# Dvouskupinový t-test a celková ANOVA se ptají na
# různé hypotézy v rámci lineárního modelu.
# Po celkové otázce můžeme vyhodnotit konkrétní páry;
# při více párech zohledníme společné porovnávání.
# Výsledek popisujte nejprve v gramech a s nejistotou,
# potom v kontextu testu a omezení pozorování.
#
# Zkuste odpovědět bez spuštění dalšího kódu:
# 1. Co znamená intercept, když je referencí Adélie?
# 2. Dokazuje velmi malé p v ANOVA rozdíl každé dvojice?
# 3. Co znamená Tukeyho interval, který obsahuje nulu?
# 4. Proč tyto údaje samy nedokazují příčinu rozdílů?

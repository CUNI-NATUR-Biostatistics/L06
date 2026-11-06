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
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít soubory -----
#--------------------------------------------------#
# Ke cvičení potřebujete dva soubory: tento skript cviceni.R a datový
# soubor palmer_penguins.csv. Oba najdete na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L06/current/code/cviceni.R
# https://cuni-natur-biostatistics.github.io/L06/current/data/palmer_penguins.csv
#
# Jak soubory uložit:
# 1. Vytvořte složku L06_praktikum a v ní podsložku data.
# 2. Soubor cviceni.R uložte do složky L06_praktikum.
# 3. Soubor palmer_penguins.csv uložte do podsložky data. Jeho jméno
#    neměňte.
# Pokud prohlížeč uloží soubory rovnou do složky Stažené soubory,
# přesuňte je odtud na uvedená místa. Pokud se soubor v prohlížeči zobrazí
# jako text, uložte ho klávesami Ctrl + S.
#
# Jak otevřít projekt v RStudiu:
# RStudio Project je obyčejná složka, ve které pracujete. RStudio do ní
# přidá soubor .Rproj, pomocí kterého složku příště snadno znovu otevřete.
# Skript, data i výstupy zůstávají samostatnými soubory uvnitř složky.
# 1. V RStudiu zvolte File > New Project > Existing Directory.
# 2. Vyberte složku L06_praktikum a potvrďte Create Project.
# 3. V panelu Files otevřete cviceni.R.
# 4. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L06_prijmeni.R.
# Příště projekt otevřete dvojklikem na soubor L06_praktikum.Rproj nebo
# v RStudiu přes File > Open Project.
#
# Výsledná složka vypadá takto:
# L06_praktikum/
# ├── L06_praktikum.Rproj
# ├── cviceni.R
# └── data/
#     └── palmer_penguins.csv

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Hlavní úlohy U01–U10 řešte v uvedeném pořadí, protože na sebe navazují.
# Pozdější úlohy používají tabulku data_tucnaci z vaší úlohy U01,
# model mod_dva_druhy z úlohy U03 a model mod_tri_druhy z úlohy U06.
# Úlohy navíc N01–N13 (bez N05) jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C). Spusťte je až tehdy, když už existují objekty,
#   které používají.
# - Nápovědy čtěte postupně. Druhá nápověda je konkrétnější než první.
# - Kopii skriptu průběžně ukládejte pomocí Ctrl + S.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte přípravu a své hotové hlavní úlohy shora dolů.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po cvičení byste měli umět:
# - fitovat lm(y ~ skupina) pro dvě i více skupin a přečíst jeho
#   koeficienty,
# - vyložit intercept jako průměr referenční skupiny a ostatní
#   koeficienty jako rozdíly vůči ní,
# - vysvětlit dvouvýběrový t-test a analýzu rozptylu (ANOVA) jako otázky
#   položené lineárnímu modelu,
# - rozlišit celkový F-test od párových (post-hoc) porovnání,
# - napsat závěr v pořadí rozdíl v gramech, nejistota, test a omezení.
#
# Navazujeme na předchozí lekce: read.csv(), str(), summary(), is.na(),
# table(), boxplot(), lm(), coef(), summary(), confint(), fitted(),
# resid(), plot(), abline(), hist(), qqnorm(), qqline()
# a cooks.distance(). Nové funkce
# vysvětlujeme vždy u úlohy, kde je poprvé potřebujete.
#
# Krátké připomenutí z minulých lekcí (pokud ho znáte, přeskočte ho):
# - odhad efektu říká, jak velký rozdíl ukazují data v původních
#   jednotkách; 95% interval spolehlivosti vyjadřuje jeho nejistotu;
# - t-statistika měří vzdálenost odhadu od nulové hodnoty ve standardních
#   chybách;
# - p-hodnota popisuje, jak neobvyklá by byla data alespoň tak vzdálená
#   od nuly jako naše, kdyby platila nulová hypotéza;
# - residuum je naměřená hodnota minus hodnota odhadnutá modelem.

#--------------------------------------------------#
## Technická kontrola souboru a balíčku -----
#--------------------------------------------------#
# Následující kód zkontroluje, zda je datový soubor na správném místě.
# Označte ho celý a spusťte Ctrl + Enter. Cesta k souboru začíná ve složce
# otevřeného projektu. Pokud soubor chybí, R se zastaví a vypíše, co máte
# zkontrolovat.
soubor_tucnaci <- "data/palmer_penguins.csv"
if (
  !file.exists(soubor_tucnaci)) {
  stop(
    paste0(
      "Soubor data/palmer_penguins.csv nebyl nalezen. ",
      "Otevřete projekt L06_praktikum (File > Open Project) a zkontrolujte ",
      "jméno a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}

# Balíček emmeans budete potřebovat v úloze U09. Následující kód označte
# celý a spusťte Ctrl + Enter. Pokud balíček chybí, R se zastaví. Potom
# zkopírujte řádek s install.packages() do panelu Console, smažte úvodní #,
# stiskněte Enter a kontrolu spusťte znovu.
# install.packages("emmeans")
if (
  !requireNamespace(
    package = "emmeans",
    quietly = TRUE
  )) {
  stop(
    paste0(
      "Chybí balíček emmeans. Spusťte v panelu Console ",
      "install.packages(\"emmeans\") a kontrolu spusťte znovu."
    ),
    call. = FALSE
  )
}

# Data pocházejí z měření dospělých tučňáků rodu Pygoscelis na Palmerově
# souostroví v Antarktidě v letech 2007–2009. Jeden řádek tabulky
# představuje jednoho změřeného tučňáka. Proměnné a jednotky:
# druh              ... Adelie (tučňák kroužkový), Chinstrap (tučňák
#                       uzdičkový) nebo Gentoo (tučňák oslí);
# ostrov            ... ostrov, na kterém byl tučňák změřen;
# delka_zobaku_mm   ... délka zobáku v mm;
# hloubka_zobaku_mm ... hloubka (výška) zobáku v mm;
# delka_kridla_mm   ... délka ploutve v mm;
# hmotnost_tela_g   ... hmotnost těla v gramech;
# pohlavi           ... female (samice) nebo male (samec);
# rok               ... rok měření.
# Zdroj: Gorman, Williams a Fraser (2014), balíček palmerpenguins, CC0.
# Původ a přípravu tabulky popisují materiály k této lekci.

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Které hmotnosti máme k dispozici? -----
#--------------------------------------------------#
# Tabulku ze souboru CSV načtete funkcí read.csv() jako v minulých
# lekcích. Načtenou tabulku zkontrolujete těmito funkcemi:
# - str() ukáže typ každého sloupce;
# - summary() vypíše souhrny sloupců;
# - colSums(x = is.na(x = ...)) spočítá v každém sloupci chybějící
#   hodnoty.
#
# Řádky vyberete hranatými závorkami: tabulka[podminka, ] ponechá řádky,
# pro které je podmínka TRUE. Výraz !is.na(x) je TRUE tam, kde hodnota
# nechybí (znak ! obrací TRUE na FALSE a naopak).
#
# Funkce factor() převede textový sloupec na kategoriální proměnnou
# s pevným pořadím úrovní (kategorií). Argument levels zadá toto pořadí.
# První úroveň bude později referenční skupinou modelu.
# Ukázka na vymyšleném vektoru:
vec_ukazka <-
  factor(
    x = c("velký", "malý", "malý"),
    levels = c("malý", "velký")
  )
levels(x = vec_ukazka)

#----------------------------------------#
### Úloha | L06-U01 -----
#----------------------------------------#

# Zadání:
# 1. Načtěte soubor, jehož cesta je uložena v soubor_tucnaci, a tabulku
#    uložte jako data_tucnaci.
# 2. Prohlédněte si ji pomocí str(), summary() a colSums() a zapište do
#    komentáře, kolik má řádků a kolik hmotností chybí.
# 3. Do data_tucnaci uložte znovu jen řádky se změřenou hmotností
#    (sloupec hmotnost_tela_g).
# 4. Sloupec druh převeďte na faktor s pořadím úrovní
#    c("Adelie", "Chinstrap", "Gentoo") a pomocí table() zjistěte počet
#    tučňáků každého druhu.

# Vaše řešení:


# Nápověda 1:
# Model hmotnosti potřebuje u každého řádku naměřenou hmotnost. Řádky
# s jinou chybějící hodnotou (například pohlaví) zatím nevadí, protože
# pohlaví v modelu nepoužíváme.
#
# Nápověda 2:
# Výsledek read.csv() přiřaďte do data_tucnaci šipkou <-. Řádky
# ponecháte výběrem data_tucnaci[!is.na(data_tucnaci$hmotnost_tela_g), ].
# Výsledek factor() přiřaďte zpět do data_tucnaci$druh.
#
# Očekávaný výsledek:
# Tabulka má 344 řádků. Hmotnost chybí u 2 tučňáků a pohlaví u 11.
# Hmotnost sahá od 2 700 do 6 300 g. Po odstranění chybějících hmotností
# zbývá 342 tučňáků: 151 Adelie, 68 Chinstrap a 123 Gentoo.
#
# Interpretace:
# Která proměnná bude v této lekci odezvou a která prediktorem? Co
# představuje jeden řádek tabulky?

#--------------------------------------------------#
## Jak se druhy liší na první pohled? -----
#--------------------------------------------------#
# Krabicový graf (boxplot) znáte z lekce o vztazích dvou proměnných.
# Formule hmotnost_tela_g ~ druh v boxplot() znamená „hmotnost po
# skupinách druhu“: každý druh dostane vlastní krabici vedle ostatních.
#
# Funkce tapply() spočítá jednu funkci zvlášť pro každou skupinu:
#   tapply(X = hodnoty, INDEX = skupiny, FUN = funkce)
# Například tapply(X = ..., INDEX = ..., FUN = mean) vrátí průměr každé
# skupiny.
#
# Ukázka grafu je zakomentovaná, protože potřebuje data_tucnaci z U01.
# boxplot(
#   formula = hmotnost_tela_g ~ druh,
#   data = data_tucnaci,
#   xlab = "Druh",
#   ylab = "Hmotnost těla (g)"
# )

#----------------------------------------#
### Úloha | L06-U02 -----
#----------------------------------------#

# Zadání:
# 1. Zkopírujte ukázku grafu, odstraňte # a graf nakreslete.
# 2. Funkcí tapply() spočítejte průměrnou hmotnost každého druhu.
# 3. Stejně spočítejte směrodatnou odchylku hmotnosti každého druhu
#    (funkce sd).

# Vaše řešení:


# Nápověda 1:
# Průměr popisuje polohu skupiny, směrodatná odchylka rozptýlení jedinců
# uvnitř skupiny. Obojí potřebujete pro každý druh zvlášť.
#
# Nápověda 2:
# Do X patří sloupec s hmotnostmi a do INDEX sloupec s druhy; pro průměr
# i směrodatnou odchylku se mění jen argument FUN.
#
# Očekávaný výsledek:
# Průměry jsou asi 3 701 g (Adelie), 3 733 g (Chinstrap) a 5 076 g
# (Gentoo). Směrodatné odchylky jsou asi 459, 384 a 504 g. V grafu leží
# krabice Gentoo zřetelně výše, krabice Adelie a Chinstrap se téměř
# překrývají.
#
# Interpretace:
# Je rozdíl průměrů Gentoo a ostatních druhů velký vzhledem k tomu, jak
# moc se liší jedinci uvnitř jednoho druhu? A rozdíl Adelie a Chinstrap?

#--------------------------------------------------#
## Dva druhy v jednom modelu -----
#--------------------------------------------------#
# U přímky byl na pravé straně formule numerický prediktor. Nyní tam bude
# druh. Model odhaduje pro každého tučňáka jednu hodnotu; pro tučňáky
# stejného druhu je to stejný průměr.
#
# Nejprve ponecháme dva druhy, Adelie a Gentoo. Operátor %in% vrací TRUE
# pro hodnoty, které patří do zadaného výčtu, například
# data_tucnaci$druh %in% c("Adelie", "Gentoo").
# Po výběru řádků faktor stále pamatuje i nepoužitou úroveň Chinstrap.
# Funkce droplevels() ji odstraní; levels() vypíše úrovně, které zůstaly.
#
# První úroveň faktoru je referenční skupina. Intercept je její průměr
# a druhý koeficient rozdíl druhé skupiny vůči ní. Krátký vymyšlený
# příklad se dvěma skupinami A a B:
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
# Intercept 3 100 g je průměr skupiny A; koeficient skupinaB 1 000 g je
# rozdíl průměrů B minus A.

#----------------------------------------#
### Úloha | L06-U03 -----
#----------------------------------------#

# Zadání:
# 1. Z data_tucnaci vytvořte tabulku data_dva_druhy, která obsahuje jen
#    řádky druhů Adelie a Gentoo.
# 2. Ze sloupce druh v data_dva_druhy odstraňte nepoužitou úroveň
#    a funkcí levels() ověřte, že první úrovní je Adelie.
# 3. Fitujte model mod_dva_druhy, ve kterém je odezvou hmotnost_tela_g
#    a prediktorem druh, a vypište jeho koeficienty.

# Vaše řešení:


# Nápověda 1:
# Výběr řádků určí, které druhy v tabulce zůstanou. Pořadí úrovní faktoru
# určí, který z nich bude referenční skupinou.
#
# Nápověda 2:
# Řádky vyberte jako v U01, jen s podmínkou postavenou z %in%. Výsledek
# droplevels() přiřaďte zpět do data_dva_druhy$druh. Ve formuli lm() je
# odezva vlevo od ~ a druh vpravo. R zapisuje druh do modelu jako
# přepínač 0/1: Gentoo = 1, Adelie = 0. Koeficient druhGentoo je proto
# rozdíl průměrů.
#
# Očekávaný výsledek:
# data_dva_druhy má 274 řádků a úrovně "Adelie" "Gentoo". Intercept je
# asi 3 700,7 g a koeficient druhGentoo asi 1 375,4 g.
#
# Interpretace:
# Co znamenají obě čísla v gramech? Proč se druhý koeficient jmenuje
# druhGentoo, a ne druhAdelie?

#--------------------------------------------------#
## Kde jsou odhadnuté hodnoty a residua? -----
#--------------------------------------------------#
# fitted() vrací hodnoty odhadnuté modelem, resid() residua. head()
# vypíše prvních šest hodnot. confint() vrací 95% intervaly spolehlivosti
# koeficientů. Pro druhový rozdíl sledujte řádek druhGentoo, ne řádek
# interceptu.

#----------------------------------------#
### Úloha | L06-U04 -----
#----------------------------------------#

# Zadání:
# 1. Z coef(object = mod_dva_druhy) spočítejte odhadnutý průměr Gentoo
#    jako součet obou koeficientů a porovnejte jej s průměrem Gentoo
#    z U02.
# 2. Vypište prvních šest odhadnutých hodnot a prvních šest residuí
#    modelu mod_dva_druhy a ověřte první residuum výpočtem z hmotnosti
#    prvního tučňáka v data_dva_druhy.
# 3. Funkcí confint() zjistěte 95% interval rozdílu Gentoo minus Adelie.

# Vaše řešení:


# Nápověda 1:
# Model má jen dvě odhadnuté hodnoty, jednu pro každý druh. Residuum je
# naměřená hmotnost minus odhadnutá hodnota jejího druhu.
#
# Nápověda 2:
# Součet dvou čísel vrátí sum(); hmotnost prvního tučňáka je
# data_dva_druhy$hmotnost_tela_g[1]. Interval čtěte ve sloupcích 2.5 %
# a 97.5 % řádku druhGentoo.
#
# Očekávaný výsledek:
# Součet koeficientů je asi 5 076,0 g, stejně jako průměr Gentoo. Prvních
# šest odhadnutých hodnot je 3 700,7 g (všichni jsou Adelie); první
# residuum je 3 750 − 3 700,7 = 49,3 g. Interval rozdílu je asi
# 1 260,7 až 1 490,0 g.
#
# Interpretace:
# Jak velké rozdíly v gramech jsou podle intervalu s daty slučitelné?
# Je i nejmenší z nich biologicky výrazný?

#--------------------------------------------------#
## Je rozdíl slučitelný s nulou? -----
#--------------------------------------------------#
# Řádek druhGentoo v summary() obsahuje odhad, standardní chybu,
# t-statistiku a p-hodnotu testu rozdílu Gentoo minus Adelie.
# t-statistika je odhad vydělený jeho standardní chybou: říká, kolik
# standardních chyb leží odhad od nuly.
#
# Velmi malé p-hodnoty R zkracuje: <2e-16 znamená menší než 2 · 10^(−16).

#----------------------------------------#
### Úloha | L06-U05 -----
#----------------------------------------#

# Zadání:
# 1. Zobrazte summary(object = mod_dva_druhy) a v řádku druhGentoo
#    najděte odhad, standardní chybu, t-statistiku a p-hodnotu.
#    Residuální stupně volnosti jsou uvedeny pod tabulkou.
# 2. Z odhadu a standardní chyby spočítejte t-statistiku a porovnejte ji
#    se sloupcem t value.
# 3. Vlastními slovy a v gramech zapište nulovou hypotézu tohoto testu.

# Vaše řešení:


# Nápověda 1:
# Test v řádku druhGentoo se ptá, zda je rozdíl Gentoo minus Adelie
# slučitelný s nulou. Řádek (Intercept) testuje něco jiného.
#
# Nápověda 2:
# Číslo ze sloupce Estimate vydělte číslem ze sloupce Std. Error.
#
# Očekávaný výsledek:
# Odhad rozdílu je asi 1 375,4 g a standardní chyba asi 58,2 g, takže
# t = 1 375,4 / 58,2 ≈ 23,6, stejně jako ve sloupci t value (23,61) při
# 272 residuálních stupních volnosti. P-hodnota je zkrácená na <2e-16.
# H0: rozdíl průměrné hmotnosti Gentoo minus Adelie je v populaci 0 g.
#
# Interpretace:
# Znamená velmi malá p-hodnota sama o sobě velký biologický rozdíl? Co
# k tomu potřebujete vědět navíc?

#--------------------------------------------------#
## Třetí druh, stejná formule -----
#--------------------------------------------------#
# Do modelu přidáme Chinstrap. U tří úrovní faktoru má model jeden
# referenční průměr (Adelie) a dva rozdíly vůči němu: druhChinstrap
# a druhGentoo. Rozdíl Gentoo minus Chinstrap mezi koeficienty není.

#----------------------------------------#
### Úloha | L06-U06 -----
#----------------------------------------#

# Zadání:
# 1. Z úplné tabulky data_tucnaci z U01 fitujte model mod_tri_druhy se
#    stejnou formulí jako v U03.
# 2. Vypište jeho koeficienty a 95% intervaly spolehlivosti.
# 3. Z koeficientů spočítejte odhadnutý průměr Chinstrap a Gentoo.

# Vaše řešení:


# Nápověda 1:
# Formule se nemění, mění se jen data. Každý další druh přidá jeden
# rozdílový koeficient vůči referenční skupině.
#
# Nápověda 2:
# V lm() použijte data = data_tucnaci. K interceptu přičtěte zvlášť
# druhChinstrap a zvlášť druhGentoo.
#
# Očekávaný výsledek:
# Intercept asi 3 700,7 g (Adelie); druhChinstrap asi +32,4 g, takže
# Chinstrap asi 3 733,1 g; druhGentoo asi +1 375,4 g, takže Gentoo asi
# 5 076,0 g. Interval druhChinstrap je asi −100,4 až 165,2 g.
#
# Interpretace:
# Proč u Chinstrap interval obsahuje nulu, zatímco u Gentoo ne? Na jakou
# otázku koeficienty neodpovídají?

#--------------------------------------------------#
## Sedí model k datům? -----
#--------------------------------------------------#
# Než model použijete k testům, zkontrolujte ho stejně jako v minulé lekci.
# - plot() s fitted() na ose x a resid() na ose y nakreslí residua proti
#   odhadnutým hodnotám; abline(h = 0, lty = 2) přidá přerušovanou čáru
#   v nule.
# - hist() nakreslí histogram residuí.
# - qqnorm() nakreslí Q–Q graf residuí a qqline() do něj přidá
#   referenční přímku. Body blízko přímky odpovídají přibližně
#   normálnímu tvaru residuí.
# - cooks.distance(model = ...) vrátí Cookovu vzdálenost každého tučňáka:
#   jak moc by se změnily odhady modelu, kdybychom ho vynechali. Hodnota
#   4/n (n je počet tučňáků v modelu) jen označuje jedince, na které se
#   vyplatí podívat blíž; není to pravidlo pro mazání dat. S rostoucím n
#   klesá, takže ve velkém výběru ji několik jedinců překročí běžně.
# - plot() s jediným vektorem a argumentem type = "h" nakreslí každou
#   hodnotu jako svislou čáru v pořadí řádků.
# - Porovnání jako x > 0.3 vrátí pro každou hodnotu TRUE nebo FALSE
#   a funkce sum() z nich spočítá, kolikrát vyšlo TRUE.
# - Panel Plots ukazuje vždy poslední graf; starší grafy najdete šipkami
#   v jeho horní liště.
# U kategoriálního prediktoru tvoří residua svislé pásy, jeden pro každý
# odhadnutý průměr. To je vlastnost modelu, ne chyba. Sledujte, zda je
# některý pás výrazně širší nebo zda leží některý bod velmi daleko.
# Test také předpokládá nezávislá pozorování: hmotnost jednoho tučňáka
# neprozrazuje nic o hmotnosti jiného. Tento předpoklad z grafů
# nepoznáme; posuzujeme ho podle toho, jak byla data sebrána.

#----------------------------------------#
### Úloha | L06-U07 -----
#----------------------------------------#

# Zadání:
# 1. Nakreslete residua mod_tri_druhy (osa y) proti hodnotám odhadnutým
#    modelem (osa x). Obě osy popište včetně jednotky g a přidejte
#    přerušovanou čáru v nule.
# 2. V samostatných grafech nakreslete histogram residuí a jejich Q–Q graf
#    s referenční přímkou.
# 3. Spočítejte Cookovu vzdálenost tučňáků v mod_tri_druhy, nakreslete ji
#    jako svislé čáry a přidejte vodorovnou čáru ve výšce 4/n, kde n je
#    počet řádků data_tucnaci. Zjistěte, kolik tučňáků hodnotu 4/n
#    přesahuje a jak velká je největší Cookova vzdálenost.

# Vaše řešení:


# Nápověda 1:
# Graf proti odhadnutým hodnotám ukazuje, zda se rozptýlení residuí liší
# mezi skupinami. Histogram a Q–Q graf ukazují tvar rozdělení residuí.
# Cookova vzdálenost se ptá na něco jiného: zda by odhady vypadaly jinak
# bez jediného tučňáka.
#
# Nápověda 2:
# V plot() zadejte x = fitted(object = mod_tri_druhy) a y jako residua
# stejného modelu; popisky os nastaví xlab a ylab. Do hist() dejte argument
# x s residui, do qqnorm() i qqline() argument y s residui. Cookovu
# vzdálenost vložte do plot() jako x s type = "h" a 4/n spočítejte jako
# 4 / nrow(x = data_tucnaci). Porovnání s touto hodnotou vložte do sum(),
# největší hodnotu vrátí max().
#
# Očekávaný výsledek:
# Residua tvoří svislé pásy kolem nuly, přibližně od −1 100 do +1 200 g;
# žádný pás není výrazně širší než ostatní. Pásy Adelie a Chinstrap leží
# vlevo těsně vedle sebe, protože se jejich průměry liší jen o 32 g;
# pás Gentoo leží daleko vpravo. Histogram má jeden vrchol mírně pod
# nulou a o něco delší pravý chvost. Body Q–Q grafu sledují přímku, jen
# na koncích se mírně odchylují.
# Hodnota 4/n je asi 0,012; přesahuje ji 11 z 342 tučňáků a největší
# Cookova vzdálenost je asi 0,027.
#
# Interpretace:
# Je některý pás výrazně širší než ostatní? Znamená překročení 4/n, že
# máte tučňáka z dat odstranit? Co z těchto grafů nepoznáte o nezávislosti
# tučňáků z téhož ostrova?

#--------------------------------------------------#
## Jedna celková otázka o třech druzích -----
#--------------------------------------------------#
# Analýza rozptylu (ANOVA) se ptá, zda jsou všechny tři průměry v širší
# populaci stejné. Porovnává dva modely:
# - model s jedním společným průměrem: lm(formula = hmotnost_tela_g ~ 1),
#   kde 1 znamená „jen intercept“;
# - model se třemi průměry druhů: mod_tri_druhy.
# Součet čtverců residuí (RSS) modelu s jediným průměrem je celkový součet
# čtverců. RSS modelu se třemi průměry je součet čtverců uvnitř skupin.
# Jejich rozdíl je součet čtverců mezi skupinami, tedy část variability
# zachycená druhem.
# Funkce anova(object = mod_tri_druhy) celý výpočet zobrazí v jedné
# tabulce. Sloupec Sum Sq obsahuje součty čtverců: řádek druh součet
# čtverců mezi skupinami, řádek Residuals součet čtverců uvnitř skupin
# (RSS tří průměrů). Sloupec F value je F-statistika, která porovnává
# variabilitu mezi skupinami s variabilitou uvnitř druhů; Pr(>F) je
# její p-hodnota.

#----------------------------------------#
### Úloha | L06-U08 -----
#----------------------------------------#

# Zadání:
# 1. Fitujte model mod_jeden_prumer s jediným společným průměrem
#    (formule hmotnost_tela_g ~ 1, data data_tucnaci) a přečtěte jeho
#    koeficient.
# 2. Zobrazte anova(object = mod_tri_druhy). Ze sloupce Sum Sq opište
#    součet čtverců mezi skupinami a uvnitř skupin a dále opište F, oba
#    stupně volnosti a p-hodnotu.
# 3. Zapište nulovou hypotézu celkového testu.

# Vaše řešení:


# Nápověda 1:
# Tři průměry vždy zkrátí residua aspoň trochu. F porovnává, o kolik je
# zkrátily, s typickým čtvercem residua, který zůstává uvnitř druhů.
#
# Nápověda 2:
# Koeficient modelu s jediným průměrem vrátí coef(). V tabulce anova()
# patří řádek druh k části zachycené druhem a řádek Residuals k části,
# která zůstává uvnitř druhů.
#
# Očekávaný výsledek:
# Společný průměr je asi 4 201,8 g. Ve sloupci Sum Sq je součet čtverců
# mezi skupinami asi 146 864 214 g² a uvnitř skupin (RSS tří průměrů) asi
# 72 443 483 g². F je asi 343,63 při 2 a 339 stupních volnosti
# a p-hodnota < 2.2e-16.
# H0: všechny tři průměrné hmotnosti jsou v širší populaci stejné.
#
# Interpretace:
# Co říká malá p-hodnota o třech průměrech? Proč z ní samotné nepoznáte,
# které druhy se liší, ani o kolik gramů?

#--------------------------------------------------#
## Které dvojice se liší? -----
#--------------------------------------------------#
# Celkový test neříká, které dvojice druhů se liší. Na to se ptají párová
# (post-hoc) porovnání. Funkce z balíčku emmeans je spočítají ze
# stejného modelu, bez fitování nového:
# - emmeans::emmeans(object = model, specs = ~ druh) vrátí odhadnutý
#   průměr každého druhu;
# - emmeans::contrast() z těchto průměrů vytvoří rozdíly dvojic.
#   Argument method = "revpairwise" dá rozdíly ve směru Chinstrap minus
#   Adelie, Gentoo minus Adelie a Gentoo minus Chinstrap.
#   Argument adjust = "tukey" upraví intervaly a p-hodnoty tak, aby
#   zohlednily, že se díváme na tři dvojice současně.
# - summary(object = ..., infer = c(TRUE, TRUE)) vypíše intervaly
#   (sloupce lower.CL a upper.CL) i upravené p-hodnoty (p.value).
# Tukeyho úprava sama zohlední počet dvojic; nepotřebuje předchozí
# statisticky významný F-test.

#----------------------------------------#
### Úloha | L06-U09 -----
#----------------------------------------#

# Zadání:
# 1. Z mod_tri_druhy vytvořte objekt prumery_druhu s odhadnutými průměry
#    druhů.
# 2. Z prumery_druhu vytvořte objekt post_hoc_druhy s rozdíly všech
#    dvojic a Tukeyho úpravou.
# 3. Vypište intervaly a upravené p-hodnoty.
# 4. U každé dvojice zapište směr a velikost rozdílu v gramech a zda
#    interval obsahuje nulu.

# Vaše řešení:


# Nápověda 1:
# Postup má dva kroky: nejprve průměry druhů, potom rozdíly mezi nimi.
# Interval obsahující nulu znamená, že data rozdíl od nuly neodlišují.
#
# Nápověda 2:
# Do emmeans::contrast() dejte object = prumery_druhu spolu s argumenty
# method a adjust popsanými výše. Výsledek vložte do summary() s infer.
#
# Očekávaný výsledek:
# Chinstrap minus Adelie asi +32,4 g, interval asi −127 až 191 g
# (obsahuje nulu), upravená p-hodnota asi 0,881. Gentoo minus Adelie asi
# +1 375,4 g (interval asi 1 243 až 1 508 g) a Gentoo minus Chinstrap
# asi +1 342,9 g (interval asi 1 178 až 1 507 g); oba intervaly leží celé
# nad nulou.
#
# Interpretace:
# Dokazuje interval Chinstrap minus Adelie, že průměry obou druhů jsou
# přesně stejné? Odporuje tento výsledek celkovému F-testu z U08?

#--------------------------------------------------#
## Co lze říci o tučňácích? -----
#--------------------------------------------------#
# Druh v těchto datech souvisí s ostrovem: všichni tučňáci uzdičkoví
# (Chinstrap) byli měřeni na ostrově Dream a všichni tučňáci oslí
# (Gentoo) na Biscoe, jen Adelie na všech třech ostrovech (ověříte
# v úloze navíc N04). Hmotnost se liší také podle pohlaví. Model
# s jediným prediktorem tyto souvislosti neoddělí. Jde o observační data,
# takže rozdíly mezi druhy jsou asociace, ne prokázaný účinek druhu.

#----------------------------------------#
### Úloha | L06-U10 -----
#----------------------------------------#

# Zadání:
# Napište do komentáře 4–6 vět pro biologa v tomto pořadí:
# 1. biologická otázka a jednotka měření;
# 2. rozdíly průměrů v gramech;
# 3. jejich nejistota z intervalů;
# 4. celkový test a závěr o třech dvojicích;
# 5. kontrola residuí a alespoň dvě omezení observačních dat.

# Vaše řešení:


# Nápověda 1:
# Začněte rozdílem Gentoo a Adelie v gramech a řekněte, jak velké rozdíly
# připouští jeho interval. Test až potom doplňuje, nenahrazuje.
#
# Nápověda 2:
# Čísla vezměte z U02 (průměry), U09 (rozdíly a intervaly) a U08
# (F-test); omezení z úvodu tohoto oddílu a z grafů v U07.
#
# Očekávaný výsledek:
# Závěr začíná gramy, ne p-hodnotou. Uvádí, že Gentoo jsou asi o 1 343 až
# 1 375 g těžší než Adelie i Chinstrap s intervaly celými nad nulou, a že
# rozdíl Adelie a Chinstrap (asi 32 g) data od nuly neodlišují. Zmíní
# F-test, rozumná residua, propojení druhu s ostrovem a souvislost
# hmotnosti s pohlavím. Netvrdí, že druh rozdíl hmotnosti způsobil.
#
# Interpretace:
# Která věta vašeho závěru by se změnila, kdyby tučňáci byli přiřazeni ke
# skupinám náhodně, jako v pokusu?

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#
# Tyto úlohy jsou dobrovolné. Vyberte si jednu nebo několik; nejsou
# podmínkou dokončení hlavních úloh. Nové objekty pojmenujte tak, jak
# uvádí zadání, abyste nepřepsali objekty z hlavních úloh.

#--------------------------------------------------#
## Referenční skupina a kódování -----
#--------------------------------------------------#
# Funkce relevel() nastaví zvolenou úroveň faktoru jako první, tedy jako
# referenční skupinu: relevel(x = faktor, ref = "úroveň").

#----------------------------------------#
### Úloha navíc | L06-N01 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte kopii data_tucnaci s názvem data_jina_reference.
# 2. Ve sloupci druh v této kopii nastavte Gentoo jako referenční skupinu.
# 3. Fitujte mod_jina_reference se stejnou formulí jako v U06 a porovnejte
#    jeho koeficienty s U06.
# 4. Funkcí all.equal() ověřte, že se odhadnuté hodnoty obou modelů
#    nezměnily. all.equal() vrátí TRUE, když jsou dva vektory (téměř)
#    stejné.

# Vaše řešení:


# Nápověda 1:
# Referenční skupina určuje, od čeho se koeficienty měří, ale nemění data
# ani průměry druhů.
#
# Nápověda 2:
# Kopii vytvoříte přiřazením data_jina_reference <- data_tucnaci.
# Do all.equal() vložte fitted() obou modelů.
#
# Očekávaný výsledek:
# Intercept je asi 5 076,0 g (Gentoo); druhAdelie asi −1 375,4 g
# a druhChinstrap asi −1 342,9 g. Odhadnuté hodnoty jsou stejné;
# all.equal() vrátí TRUE.

#----------------------------------------#
### Úloha navíc | L06-N02 -----
#----------------------------------------#

# Zadání:
# Fitujte model mod_adelie_chinstrap jen pro Adelie a Chinstrap (postup
# jako v U03) a z confint() a summary() přečtěte interval a p-hodnotu
# rozdílu Chinstrap minus Adelie. Porovnejte interval s Tukeyho
# intervalem stejné dvojice z U09.

# Vaše řešení:


# Nápověda 1:
# Data připouštějí malé rozdíly v obou směrech; nula je jen jednou
# z hodnot slučitelných s daty.
#
# Nápověda 2:
# Podmínka výběru je druh %in% c("Adelie", "Chinstrap"); nezapomeňte
# droplevels().
#
# Očekávaný výsledek:
# Rozdíl asi +32,4 g, interval asi −93,4 až 158,2 g, p-hodnota asi 0,612.
# Tukeyho interval stejné dvojice (asi −127 až 191 g) je širší, protože
# zohledňuje tři porovnání současně a používá rozptyl všech tří druhů.

#----------------------------------------#
### Úloha navíc | L06-N03 -----
#----------------------------------------#

# Zadání:
# Ve výsledku U02 porovnejte nejvyšší a nejnižší směrodatnou odchylku
# druhu s rozdíly průměrů z U06 a U09. Napište, proč F-statistika z U08
# neříká, o kolik gramů se druhy liší.

# Vaše řešení:


# Nápověda 1:
# Rozdíly průměrů popisují polohu skupin; směrodatná odchylka rozptýlení
# jedinců uvnitř skupiny.
#
# Nápověda 2:
# Podělte rozdíl průměrů směrodatnou odchylkou a sledujte, kolik
# „typických odchylek“ rozdíl měří.
#
# Očekávaný výsledek:
# Směrodatné odchylky jsou asi 384 až 504 g. Rozdíl Gentoo a ostatních
# druhů (asi 1 343 až 1 375 g) je asi trojnásobkem typické odchylky,
# rozdíl Adelie a Chinstrap (asi 32 g) je mnohem menší. F je podíl dvou
# variabilit, nemá jednotku gram.

#----------------------------------------#
### Úloha navíc | L06-N04 -----
#----------------------------------------#

# Zadání:
# 1. Z data_tucnaci vytvořte tabulku počtů kombinací druhu a ostrova
#    funkcí table().
# 2. Funkcí tapply() spočítejte pro každý druh, u kolika tučňáků chybí
#    pohlaví.
# 3. Napište, co tyto údaje znamenají pro větu „druh způsobuje rozdíl
#    hmotnosti“. Nefitujte další model.

# Vaše řešení:


# Nápověda 1:
# Nejprve zjistěte, zda jsou druhy na ostrovech vůbec zastoupeny společně.
#
# Nápověda 2:
# Do table() dejte dva sloupce oddělené čárkou. V tapply() je X
# is.na(data_tucnaci$pohlavi), INDEX druh a FUN = sum.
#
# Očekávaný výsledek:
# Chinstrap byli měřeni jen na ostrově Dream, Gentoo jen na Biscoe
# a Adelie na všech třech ostrovech. Pohlaví chybí u 5 Adelie, 0 Chinstrap
# a 4 Gentoo. Druh nelze v těchto datech oddělit od ostrova.

#--------------------------------------------------#
## Ověření výpočtů -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L06-N06 -----
#----------------------------------------#

# Zadání:
# Z výstupu anova(object = mod_tri_druhy) vezměte F a oba stupně volnosti
# a funkcí pf() spočítejte p-hodnotu. Funkce pf(q = F, df1 = ...,
# df2 = ..., lower.tail = FALSE) vrátí plochu F-rozdělení napravo od F.

# Vaše řešení:


# Nápověda 1:
# P-hodnota F-testu je plocha napravo od pozorovaného F, protože velké F
# svědčí proti stejným průměrům.
#
# Nápověda 2:
# df1 je počet stupňů volnosti v řádku druh, df2 v řádku Residuals.
#
# Očekávaný výsledek:
# P-hodnota je asi 2,9 · 10^(−82); anova() ji zkracuje na < 2.2e-16.

#----------------------------------------#
### Úloha navíc | L06-N07 -----
#----------------------------------------#

# Zadání:
# Ověřte, že se residua každého druhu v mod_tri_druhy sčítají na nulu.
# Použijte tapply() s residui, druhem a funkcí sum. Zaokrouhlete výsledek
# funkcí round() na 6 desetinných míst.

# Vaše řešení:


# Nápověda 1:
# Residuum je vzdálenost od průměru vlastního druhu.
#
# Nápověda 2:
# Residua i druh patří ke stejným řádkům data_tucnaci, takže je tapply()
# může spárovat.
#
# Očekávaný výsledek:
# Všechny tři součty jsou 0. Odhadnutá hodnota každého druhu je jeho
# průměr, a odchylky od průměru se vždy vyruší.

#--------------------------------------------------#
## Párová porovnání podrobněji -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L06-N08 -----
#----------------------------------------#

# Zadání:
# Vypište prumery_druhu z U09. Sloupce lower.CL a upper.CL zde vymezují
# interval každého průměru zvlášť. Porovnejte je s intervaly rozdílů
# z U09 a napište, proč to nejsou stejné otázky.

# Vaše řešení:


# Nápověda 1:
# Interval průměru odpovídá na otázku „kde leží průměr druhu?“, interval
# rozdílu na otázku „o kolik se dva druhy liší?“.
#
# Nápověda 2:
# Stačí napsat název objektu a spustit jej.
#
# Očekávaný výsledek:
# Průměry asi 3 701, 3 733 a 5 076 g s intervaly asi 3 627–3 775,
# 3 623–3 843 a 4 994–5 158 g. Tyto intervaly popisují nejistotu
# jednotlivých průměrů, ne rozdílů mezi nimi.

#----------------------------------------#
### Úloha navíc | L06-N09 -----
#----------------------------------------#

# Zadání:
# Vytvořte post_hoc_bez_upravy stejně jako post_hoc_druhy v U09, jen
# s adjust = "none". Porovnejte šířku intervalů a p-hodnoty s Tukeyho
# úpravou.

# Vaše řešení:


# Nápověda 1:
# Čím více dvojic čteme, tím snáz některá vyjde náhodně extrémní.
#
# Nápověda 2:
# Hodnota "none" argumentu adjust vypne úpravu na počet dvojic.
#
# Očekávaný výsledek:
# Bez úpravy je interval Chinstrap minus Adelie asi −100 až 165 g
# a p-hodnota asi 0,631; s Tukeyho úpravou asi −127 až 191 g a 0,881.
# Tukeyho intervaly jsou širší, protože chrání všechny tři dvojice
# současně.

#--------------------------------------------------#
## Stejný postup v nové situaci -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L06-N10 -----
#----------------------------------------#

# Zadání:
# Fitujte mod_ploutev, ve kterém je odezvou hmotnost_tela_g a prediktorem
# numerická délka ploutve (delka_kridla_mm). Porovnejte význam druhého
# koeficientu s koeficientem druhGentoo v mod_dva_druhy.

# Vaše řešení:


# Nápověda 1:
# Formule má stejný tvar, mění se jen typ prediktoru a tím význam
# koeficientu.
#
# Nápověda 2:
# Numerický sloupec ve formuli nevyžaduje faktor; koeficient se pak
# jmenuje podle sloupce, ne podle úrovně.
#
# Očekávaný výsledek:
# Intercept asi −5 780,8 g a sklon asi 49,7 g na 1 mm. Sklon je změna
# hmotnosti při prodloužení ploutve o 1 mm; druhGentoo je rozdíl průměrů
# dvou skupin. Záporný intercept je extrapolace k ploutvi dlouhé 0 mm.

#----------------------------------------#
### Úloha navíc | L06-N11 -----
#----------------------------------------#

# Zadání:
# Celý postup zopakujte pro jiný kategoriální prediktor, ostrov:
# 1. fitujte mod_ostrov s formulí hmotnost_tela_g ~ ostrov;
# 2. zjistěte, který ostrov je referenční skupinou, a vyložte koeficienty;
# 3. zobrazte anova(object = mod_ostrov).

# Vaše řešení:


# Nápověda 1:
# Textový sloupec použije R jako faktor s úrovněmi v abecedním pořadí.
#
# Nápověda 2:
# Úrovně zjistíte pomocí levels(x = factor(x = data_tucnaci$ostrov)).
#
# Očekávaný výsledek:
# Referenční skupinou je Biscoe (abecedně první), jeho průměr je asi
# 4 716,0 g.
# Dream je asi o 1 003,1 g a Torgersen asi o 1 009,6 g lehčí. F je asi
# 110,0 při 2 a 339 stupních volnosti.
#
# Interpretace:
# Všichni tučňáci oslí žijí v datech na Biscoe. Je rozdíl ostrovů
# důsledkem ostrova, nebo druhu? Proč to jeden model s jedním
# prediktorem nerozliší?

#----------------------------------------#
### Úloha navíc | L06-N12 -----
#----------------------------------------#

# Zadání:
# V summary(object = mod_dva_druhy) najděte pod tabulkou řádek
# F-statistic. Porovnejte jeho hodnotu s druhou mocninou t-statistiky
# řádku druhGentoo.

# Vaše řešení:


# Nápověda 1:
# U dvou skupin je jediná dvojice, takže celková a párová otázka splynou.
#
# Nápověda 2:
# Druhou mocninu spočítáte operátorem ^, například 23.61^2.
#
# Očekávaný výsledek:
# F je asi 557,6. Zaokrouhlené t² = 23,61² vyjde asi 557,4; s přesnou
# t-statistikou z výstupu vyjde také 557,6. U dvou skupin dává
# celkový F-test stejnou odpověď jako t-test koeficientu.

# Tabulku anova() z U08 můžete sestavit i ručně:
# - součet čtverců residuí (RSS) je součet umocněných residuí,
#   sum(resid(object = model)^2);
# - průměrný čtverec (MS) je součet čtverců dělený stupni volnosti. Mezi
#   skupinami dělíme 2, protože tři průměry popisuje jeden referenční
#   průměr a dva rozdíly. Uvnitř skupin dělíme residuálními stupni
#   volnosti, které vrátí df.residual(object = mod_tri_druhy);
# - F-statistika je podíl průměrného čtverce mezi skupinami a uvnitř nich.

#----------------------------------------#
### Úloha navíc | L06-N13 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_jeden_prumer a mod_tri_druhy z U08.
# 1. Spočítejte RSS obou modelů a jejich rozdíl. Najděte svá čísla ve
#    sloupci Sum Sq tabulky anova().
# 2. Spočítejte oba průměrné čtverce a jejich podíl F. Výsledek porovnejte
#    se sloupci Mean Sq a F value tabulky anova().

# Vaše řešení:


# Nápověda 1:
# RSS jednoho průměru je celkový součet čtverců. Kdyby druh nepomáhal, byl
# by průměrný čtverec mezi skupinami podobně velký jako uvnitř nich a F by
# bylo kolem 1.
#
# Nápověda 2:
# RSS získáte jako sum() z umocněných resid(), zvlášť pro každý model.
# Součet čtverců mezi skupinami dělte dvěma, součet čtverců uvnitř skupin
# (RSS tří průměrů) dělte výsledkem df.residual(); potom oba výsledky
# podělte.
#
# Očekávaný výsledek:
# Celkový součet čtverců (RSS jednoho průměru) je asi 219 307 697 g²,
# součet čtverců uvnitř skupin (RSS tří průměrů) asi 72 443 483 g² a jejich
# rozdíl, součet čtverců mezi skupinami, asi 146 864 214 g². Průměrné
# čtverce jsou asi 73 432 107 a 213 698 g², takže F je asi 343,63, stejně
# jako v tabulce anova().

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Co znamená intercept, když je referenční skupinou Adelie?
# 2. Na jakou otázku odpovídá test v řádku druhGentoo a jaká je jeho
#    nulová hypotéza?
# 3. Na jakou otázku odpovídá celkový F-test a na jakou párová
#    porovnání?
# 4. Co znamená Tukeyho interval, který obsahuje nulu?
# 5. Proč tyto údaje samy nedokazují, že druh hmotnost způsobuje?
# Pokud si nejste jistí, vraťte se k úlohám U03, U05, U08, U09 a U10.
#
# Věcný závěr začíná velikostí rozdílů v gramech a jejich nejistotou.
# Test odpovídá na užší otázku: jak slučitelná jsou data se stejnými
# průměry za předpokladů modelu.

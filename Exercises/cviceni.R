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
# přesuňte je odtud na uvedená místa.
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
# Úlohy navíc N01–N13 jsou dobrovolné. Slouží k dalšímu procvičování,
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
# table(), lm(), coef(), summary(), confint(), fitted(), resid(), plot()
# a abline(). Nové funkce vysvětlujeme vždy u úlohy, kde je poprvé
# potřebujete.
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
## Technická kontrola souboru -----
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
      "Otevřete projekt L06_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
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


# Očekávaný výsledek:
# Tabulka má 344 řádků. Hmotnost chybí u 2 tučňáků a pohlaví u 11.
# Hmotnost sahá od 2 700 do 6 300 g. Po odstranění chybějících hmotností
# zbývá 342 tučňáků: 151 Adelie, 68 Chinstrap a 123 Gentoo.
#
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
# Interpretace:
# Která proměnná bude v této lekci odezvou a která prediktorem? Co
# představuje jeden řádek tabulky?

#--------------------------------------------------#
## Jak se druhy liší na první pohled? -----
#--------------------------------------------------#
# Funkce stripchart() nakreslí jednotlivé hodnoty pro každou skupinu.
# Formule hmotnost_tela_g ~ druh dá hmotnost na jednu osu a druhy vedle
# sebe. Argument method = "jitter" posune překrývající se body mírně do
# stran a vertical = TRUE dá hmotnost na svislou osu.
#
# Funkce tapply() spočítá jednu funkci zvlášť pro každou skupinu:
#   tapply(X = hodnoty, INDEX = skupiny, FUN = funkce)
# Například tapply(X = ..., INDEX = ..., FUN = mean) vrátí průměr každé
# skupiny.
#
# Ukázka grafu je zakomentovaná, protože potřebuje data_tucnaci z U01.
# stripchart(
#   x = hmotnost_tela_g ~ druh,
#   data = data_tucnaci,
#   method = "jitter",
#   vertical = TRUE,
#   pch = 16,
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


# Očekávaný výsledek:
# Průměry jsou asi 3 701 g (Adelie), 3 733 g (Chinstrap) a 5 076 g
# (Gentoo). Směrodatné odchylky jsou asi 459, 384 a 504 g. V grafu leží
# body Gentoo zřetelně výše, Adelie a Chinstrap se téměř překrývají.
#
# Nápověda 1:
# Průměr popisuje polohu skupiny, směrodatná odchylka rozptýlení jedinců
# uvnitř skupiny. Obojí potřebujete pro každý druh zvlášť.
#
# Nápověda 2:
# Do X patří sloupec s hmotnostmi a do INDEX sloupec s druhy; pro průměr
# i směrodatnou odchylku se mění jen argument FUN.
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


# Očekávaný výsledek:
# data_dva_druhy má 274 řádků a úrovně "Adelie" "Gentoo". Intercept je
# asi 3 700,7 g a koeficient druhGentoo asi 1 375,4 g.
#
# Nápověda 1:
# Výběr řádků určí, které druhy v tabulce zůstanou. Pořadí úrovní faktoru
# určí, který z nich bude referencí.
#
# Nápověda 2:
# Řádky vyberte jako v U01, jen s podmínkou postavenou z %in%. Výsledek
# droplevels() přiřaďte zpět do data_dva_druhy$druh. Ve formuli lm() je
# odezva vlevo od ~ a druh vpravo.
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


# Očekávaný výsledek:
# Součet koeficientů je asi 5 076,0 g, stejně jako průměr Gentoo. Prvních
# šest odhadnutých hodnot je 3 700,7 g (všichni jsou Adelie); první
# residuum je 3 750 − 3 700,7 = 49,3 g. Interval rozdílu je asi
# 1 260,7 až 1 490,0 g.
#
# Nápověda 1:
# Model má jen dvě odhadnuté hodnoty, jednu pro každý druh. Residuum je
# naměřená hmotnost minus odhadnutá hodnota jejího druhu.
#
# Nápověda 2:
# Součet dvou čísel vrátí sum(); hmotnost prvního tučňáka je
# data_dva_druhy$hmotnost_tela_g[1]. Interval čtěte ve sloupcích 2.5 %
# a 97.5 % řádku druhGentoo.
#
# Interpretace:
# Jak velké rozdíly v gramech jsou podle intervalu s daty slučitelné?
# Je i nejmenší z nich biologicky výrazný?

#--------------------------------------------------#
## Jak souvisí model s dvouvýběrovým t-testem? -----
#--------------------------------------------------#
# Nulová hypotéza H0 tvrdí, že rozdíl průměrů Gentoo minus Adelie je
# v širší populaci 0 g. Řádek druhGentoo v summary() obsahuje odhad,
# standardní chybu, t-statistiku a p-hodnotu tohoto testu.
#
# Klasický dvouvýběrový t-test se společným rozptylem obou skupin položí
# tutéž otázku. Funkce t.test() porovná hmotnosti dvou skupin:
#   t.test(x = hmotnosti_prvni_skupiny, y = hmotnosti_druhe_skupiny,
#          var.equal = TRUE)
# Argument var.equal = TRUE nastaví společný rozptyl jako v lm(). Rozdíl
# počítá jako x minus y, proto pro Gentoo minus Adelie patří Gentoo do x.
# Hmotnosti jednoho druhu vyberete takto:
#   data_dva_druhy$hmotnost_tela_g[data_dva_druhy$druh == "Gentoo"]
#
# Velmi malé p-hodnoty R zkracuje: <2e-16 znamená menší než 2 · 10^(−16).

#----------------------------------------#
### Úloha | L06-U05 -----
#----------------------------------------#

# Zadání:
# 1. Zobrazte summary(object = mod_dva_druhy) a v řádku druhGentoo
#    najděte odhad, standardní chybu, t-statistiku a p-hodnotu.
#    Residuální stupně volnosti jsou uvedeny pod tabulkou.
# 2. Funkcí t.test() porovnejte hmotnosti Gentoo (x) a Adelie (y)
#    z data_dva_druhy se společným rozptylem.
# 3. Porovnejte rozdíl, t, stupně volnosti, p-hodnotu a 95% interval
#    obou výstupů.

# Vaše řešení:


# Očekávaný výsledek:
# Oba postupy dávají t = 23,61 při 272 stupních volnosti a interval
# 1 260,7 až 1 490,0 g. P-hodnota je v obou výstupech zkrácená:
# <2e-16 v summary() a < 2.2e-16 v t.test(). Rozdíl průměrů je
# asi 1 375,4 g, stejně jako koeficient druhGentoo.
#
# Nápověda 1:
# Obě funkce porovnávají stejný rozdíl, ve stejném směru a se stejným
# předpokladem o rozptylu skupin.
#
# Nápověda 2:
# Do x dejte hmotnosti s podmínkou druh == "Gentoo", do y hmotnosti
# s podmínkou druh == "Adelie". V summary() čtěte řádek druhGentoo, ne
# řádek (Intercept).
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


# Očekávaný výsledek:
# Intercept asi 3 700,7 g (Adelie); druhChinstrap asi +32,4 g, takže
# Chinstrap asi 3 733,1 g; druhGentoo asi +1 375,4 g, takže Gentoo asi
# 5 076,0 g. Interval druhChinstrap je asi −100,4 až 165,2 g.
#
# Nápověda 1:
# Formule se nemění, mění se jen data. Každý další druh přidá jeden
# rozdílový koeficient vůči referenci.
#
# Nápověda 2:
# V lm() použijte data = data_tucnaci. K interceptu přičtěte zvlášť
# druhChinstrap a zvlášť druhGentoo.
#
# Interpretace:
# Proč u Chinstrap interval obsahuje nulu, zatímco u Gentoo ne? Na jakou
# otázku koeficienty neodpovídají?

#--------------------------------------------------#
## Sedí model k datům? -----
#--------------------------------------------------#
# Než model použijete k testům, zkontrolujte residua jako u přímky.
# - plot() s fitted() na ose x a resid() na ose y nakreslí residua proti
#   odhadnutým hodnotám; abline(h = 0, lty = 2) přidá přerušovanou čáru
#   v nule.
# - qqnorm() nakreslí Q–Q graf residuí a qqline() do něj přidá
#   referenční přímku. Body blízko přímky odpovídají přibližně
#   normálnímu tvaru residuí.
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
# 2. V samostatném grafu nakreslete Q–Q graf residuí s referenční
#    přímkou.

# Vaše řešení:


# Očekávaný výsledek:
# Residua tvoří svislé pásy kolem nuly, přibližně od −1 100 do +1 200 g;
# žádný pás není výrazně širší než ostatní. Pásy Adelie a Chinstrap leží
# vlevo těsně vedle sebe, protože se jejich průměry liší jen o 32 g;
# pás Gentoo leží daleko vpravo. Body Q–Q grafu sledují přímku, jen na
# koncích se mírně odchylují.
#
# Nápověda 1:
# Graf proti odhadnutým hodnotám ukazuje, zda se rozptýlení residuí liší
# mezi skupinami. Q–Q graf ukazuje tvar rozdělení residuí.
#
# Nápověda 2:
# V plot() zadejte x = fitted(object = mod_tri_druhy) a y jako residua
# stejného modelu; popisky os nastaví xlab a ylab. Do qqnorm() i qqline()
# dejte argument y s residui.
#
# Interpretace:
# Je některý pás výrazně širší než ostatní? Co z těchto grafů nepoznáte
# o nezávislosti tučňáků z téhož ostrova?

#--------------------------------------------------#
## Jedna celková otázka o třech druzích -----
#--------------------------------------------------#
# Analýza rozptylu (ANOVA) se ptá, zda jsou všechny tři průměry v širší
# populaci stejné. Porovnává dva modely:
# - model s jedním společným průměrem: lm(formula = hmotnost_tela_g ~ 1),
#   kde 1 znamená „jen intercept“;
# - model se třemi průměry druhů: mod_tri_druhy.
# Součet čtverců residuí (SSE) je součet umocněných residuí,
# sum(resid(object = model)^2). Rozdíl SSE obou modelů je část
# variability zachycená druhem.
# Funkce anova(object = mod_tri_druhy) celý výpočet zobrazí v jedné
# tabulce. Sloupec Sum Sq obsahuje součty čtverců: řádek druh rozdíl SSE
# obou modelů, řádek Residuals SSE tří průměrů. Sloupec F value je
# F-statistika, která tento rozdíl porovnává s variabilitou uvnitř
# druhů; Pr(>F) je její p-hodnota.

#----------------------------------------#
### Úloha | L06-U08 -----
#----------------------------------------#

# Zadání:
# 1. Fitujte model mod_jeden_prumer s jediným společným průměrem
#    (formule hmotnost_tela_g ~ 1, data data_tucnaci).
# 2. Spočítejte součet čtverců residuí tohoto modelu a modelu
#    mod_tri_druhy a jejich rozdíl.
# 3. Zobrazte anova(object = mod_tri_druhy), najděte svá čísla ve sloupci
#    Sum Sq a opište F, oba stupně volnosti a p-hodnotu.
# 4. Zapište nulovou hypotézu celkového testu.

# Vaše řešení:


# Očekávaný výsledek:
# Společný průměr je asi 4 201,8 g. SSE jednoho průměru je asi
# 219 307 697 g², SSE tří průměrů asi 72 443 483 g² a rozdíl asi
# 146 864 214 g²; stejná čísla jsou ve sloupci Sum Sq. F je asi 343,63
# při 2 a 339 stupních volnosti a p-hodnota < 2.2e-16. H0: všechny tři
# průměrné hmotnosti jsou v širší populaci stejné.
#
# Nápověda 1:
# Tři průměry vždy zkrátí residua aspoň trochu. F porovnává, o kolik je
# zkrátily, s typickým čtvercem residua, který zůstává uvnitř druhů.
#
# Nápověda 2:
# Součet čtverců získáte jako sum() z umocněných resid(), zvlášť pro
# každý model. Rozdíl odpovídá řádku druh v tabulce anova().
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
# „významný“ F-test.
#
# Balíček emmeans je potřeba pouze pro tuto úlohu. Pokud chybí, spusťte
# následující zakomentovaný příkaz samostatně v Console (bez #) a potom
# pokračujte odtud:
# install.packages("emmeans")
if (
  !requireNamespace(
    package = "emmeans",
    quietly = TRUE
  )) {
  stop(
    paste0(
      "Chybí balíček emmeans. Spusťte v Console ",
      "install.packages(\"emmeans\") a potom pokračujte v tomto oddílu."
    ),
    call. = FALSE
  )
}

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


# Očekávaný výsledek:
# Chinstrap minus Adelie asi +32,4 g, interval asi −127 až 191 g
# (obsahuje nulu), upravená p-hodnota asi 0,881. Gentoo minus Adelie asi
# +1 375,4 g (interval asi 1 243 až 1 508 g) a Gentoo minus Chinstrap
# asi +1 342,9 g (interval asi 1 178 až 1 507 g); oba intervaly leží celé
# nad nulou.
#
# Nápověda 1:
# Postup má dva kroky: nejprve průměry druhů, potom rozdíly mezi nimi.
# Interval obsahující nulu znamená, že data rozdíl od nuly neodlišují.
#
# Nápověda 2:
# Do emmeans::contrast() dejte object = prumery_druhu spolu s argumenty
# method a adjust popsanými výše. Výsledek vložte do summary() s infer.
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


# Očekávaný výsledek:
# Závěr začíná gramy, ne p-hodnotou. Uvádí, že Gentoo jsou asi o 1 343 až
# 1 375 g těžší než Adelie i Chinstrap s intervaly celými nad nulou, a že
# rozdíl Adelie a Chinstrap (asi 32 g) data od nuly neodlišují. Zmíní
# F-test, rozumná residua, propojení druhu s ostrovem a souvislost
# hmotnosti s pohlavím. Netvrdí, že druh rozdíl hmotnosti způsobil.
#
# Nápověda 1:
# Začněte rozdílem Gentoo a Adelie v gramech a řekněte, jak velké rozdíly
# připouští jeho interval. Test až potom doplňuje, nenahrazuje.
#
# Nápověda 2:
# Čísla vezměte z U02 (průměry), U09 (rozdíly a intervaly) a U08
# (F-test); omezení z úvodu tohoto oddílu a z grafů v U07.
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
## Reference a kódování -----
#--------------------------------------------------#
# Funkce relevel() nastaví zvolenou úroveň faktoru jako první, tedy jako
# referenci: relevel(x = faktor, ref = "úroveň").

#----------------------------------------#
### Úloha navíc | L06-N01 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte kopii data_tucnaci s názvem data_jina_reference.
# 2. Ve sloupci druh v této kopii nastavte Gentoo jako referenci.
# 3. Fitujte mod_jina_reference se stejnou formulí jako v U06 a porovnejte
#    jeho koeficienty s U06.
# 4. Funkcí all.equal() ověřte, že se odhadnuté hodnoty obou modelů
#    nezměnily. all.equal() vrátí TRUE, když jsou dva vektory (téměř)
#    stejné.

# Vaše řešení:


# Očekávaný výsledek:
# Intercept je asi 5 076,0 g (Gentoo); druhAdelie asi −1 375,4 g
# a druhChinstrap asi −1 342,9 g. Odhadnuté hodnoty jsou stejné;
# all.equal() vrátí TRUE.
#
# Nápověda 1:
# Reference určuje, od čeho se koeficienty měří, ale nemění data ani
# průměry druhů.
#
# Nápověda 2:
# Kopii vytvoříte přiřazením data_jina_reference <- data_tucnaci.
# Odhadnuté hodnoty porovnejte funkcí all.equal(), u obou vektorů
# odstraňte jména pomocí unname().

#----------------------------------------#
### Úloha navíc | L06-N02 -----
#----------------------------------------#

# Zadání:
# Fitujte model mod_adelie_chinstrap jen pro Adelie a Chinstrap (postup
# jako v U03) a z confint() a summary() přečtěte interval a p-hodnotu
# rozdílu Chinstrap minus Adelie. Porovnejte interval s Tukeyho
# intervalem stejné dvojice z U09.

# Vaše řešení:


# Očekávaný výsledek:
# Rozdíl asi +32,4 g, interval asi −93,4 až 158,2 g, p-hodnota asi 0,612.
# Tukeyho interval stejné dvojice (asi −127 až 191 g) je širší, protože
# zohledňuje tři porovnání současně a používá rozptyl všech tří druhů.
#
# Nápověda 1:
# Data připouštějí malé rozdíly v obou směrech; nula je jen jednou
# z hodnot slučitelných s daty.
#
# Nápověda 2:
# Podmínka výběru je druh %in% c("Adelie", "Chinstrap"); nezapomeňte
# droplevels().

#----------------------------------------#
### Úloha navíc | L06-N03 -----
#----------------------------------------#

# Zadání:
# Ve výsledku U02 porovnejte nejvyšší a nejnižší směrodatnou odchylku
# druhu s rozdíly průměrů z U06 a U09. Napište, proč F-statistika z U08
# neříká, o kolik gramů se druhy liší.

# Vaše řešení:


# Očekávaný výsledek:
# Směrodatné odchylky jsou asi 384 až 504 g. Rozdíl Gentoo a ostatních
# druhů (asi 1 343 až 1 375 g) je asi trojnásobkem typické odchylky,
# rozdíl Adelie a Chinstrap (asi 32 g) je mnohem menší. F je podíl dvou
# variabilit, nemá jednotku gram.
#
# Nápověda 1:
# Rozdíly průměrů popisují polohu skupin; směrodatná odchylka rozptýlení
# jedinců uvnitř skupiny.
#
# Nápověda 2:
# Podělte rozdíl průměrů směrodatnou odchylkou a sledujte, kolik
# „typických odchylek“ rozdíl měří.

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


# Očekávaný výsledek:
# Chinstrap byli měřeni jen na ostrově Dream, Gentoo jen na Biscoe
# a Adelie na všech třech ostrovech. Pohlaví chybí u 5 Adelie, 0 Chinstrap
# a 4 Gentoo. Druh nelze v těchto datech oddělit od ostrova.
#
# Nápověda 1:
# Nejprve zjistěte, zda jsou druhy na ostrovech vůbec zastoupeny společně.
#
# Nápověda 2:
# Do table() dejte dva sloupce oddělené čárkou. V tapply() je X
# is.na(data_tucnaci$pohlavi), INDEX druh a FUN = sum.

#--------------------------------------------------#
## Testy a jejich varianty -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L06-N05 -----
#----------------------------------------#

# Zadání:
# Zopakujte t.test() z U05 bez argumentu var.equal. R pak použije
# Welchův t-test, který nepředpokládá stejný rozptyl obou druhů.
# Porovnejte t, stupně volnosti a interval s U05.

# Vaše řešení:


# Očekávaný výsledek:
# Welchův test: t asi 23,39, asi 249,6 stupně volnosti a interval asi
# 1 259,5 až 1 491,2 g. Čísla se mírně liší od lm(), protože test už
# nepředpokládá společný rozptyl.
#
# Nápověda 1:
# Stejná otázka, jiný předpoklad o rozptylu skupin: každý druh má vlastní
# rozptyl, a proto se mění i stupně volnosti.
#
# Nápověda 2:
# Výchozí nastavení var.equal je FALSE, takže Welchův test spočítá
# t.test() s hmotnostmi Gentoo a Adelie bez dalších argumentů.

#----------------------------------------#
### Úloha navíc | L06-N06 -----
#----------------------------------------#

# Zadání:
# Z výstupu anova(object = mod_tri_druhy) vezměte F a oba stupně volnosti
# a funkcí pf() spočítejte p-hodnotu. Funkce pf(q = F, df1 = ...,
# df2 = ..., lower.tail = FALSE) vrátí plochu F-rozdělení napravo od F.

# Vaše řešení:


# Očekávaný výsledek:
# P-hodnota je asi 2,9 · 10^(−82); anova() ji zkracuje na < 2.2e-16.
#
# Nápověda 1:
# P-hodnota F-testu je plocha napravo od pozorovaného F, protože velké F
# svědčí proti stejným průměrům.
#
# Nápověda 2:
# df1 je počet stupňů volnosti v řádku druh, df2 v řádku Residuals.

#----------------------------------------#
### Úloha navíc | L06-N07 -----
#----------------------------------------#

# Zadání:
# Ověřte, že se residua každého druhu v mod_tri_druhy sčítají na nulu.
# Použijte tapply() s residui, druhem a funkcí sum. Zaokrouhlete výsledek
# funkcí round() na 6 desetinných míst.

# Vaše řešení:


# Očekávaný výsledek:
# Všechny tři součty jsou 0. Odhadnutá hodnota každého druhu je jeho
# průměr, a odchylky od průměru se vždy vyruší.
#
# Nápověda 1:
# Residuum je vzdálenost od průměru vlastního druhu.
#
# Nápověda 2:
# Residua i druh patří ke stejným řádkům data_tucnaci, takže je tapply()
# může spárovat.

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


# Očekávaný výsledek:
# Průměry asi 3 701, 3 733 a 5 076 g s intervaly asi 3 627–3 775,
# 3 623–3 843 a 4 994–5 158 g. Tyto intervaly popisují nejistotu
# jednotlivých průměrů, ne rozdílů mezi nimi.
#
# Nápověda 1:
# Interval průměru odpovídá na otázku „kde leží průměr druhu?“, interval
# rozdílu na otázku „o kolik se dva druhy liší?“.
#
# Nápověda 2:
# Stačí napsat název objektu a spustit jej.

#----------------------------------------#
### Úloha navíc | L06-N09 -----
#----------------------------------------#

# Zadání:
# Vytvořte post_hoc_bez_upravy stejně jako post_hoc_druhy v U09, jen
# s adjust = "none". Porovnejte šířku intervalů a p-hodnoty s Tukeyho
# úpravou.

# Vaše řešení:


# Očekávaný výsledek:
# Bez úpravy je interval Chinstrap minus Adelie asi −100 až 165 g
# a p-hodnota asi 0,631; s Tukeyho úpravou asi −127 až 191 g a 0,881.
# Tukeyho intervaly jsou širší, protože chrání všechny tři dvojice
# současně.
#
# Nápověda 1:
# Čím více dvojic čteme, tím snáz některá vyjde náhodně extrémní.
#
# Nápověda 2:
# Hodnota "none" argumentu adjust vypne úpravu na počet dvojic.

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


# Očekávaný výsledek:
# Intercept asi −5 780,8 g a sklon asi 49,7 g na 1 mm. Sklon je změna
# hmotnosti při prodloužení ploutve o 1 mm; druhGentoo je rozdíl průměrů
# dvou skupin. Záporný intercept je extrapolace k ploutvi dlouhé 0 mm.
#
# Nápověda 1:
# Formule má stejný tvar, mění se jen typ prediktoru a tím význam
# koeficientu.
#
# Nápověda 2:
# Numerický sloupec ve formuli nevyžaduje faktor; koeficient se pak
# jmenuje podle sloupce, ne podle úrovně.

#----------------------------------------#
### Úloha navíc | L06-N11 -----
#----------------------------------------#

# Zadání:
# Celý postup zopakujte pro jiný kategoriální prediktor, ostrov:
# 1. fitujte mod_ostrov s formulí hmotnost_tela_g ~ ostrov;
# 2. zjistěte, který ostrov je referencí, a vyložte koeficienty;
# 3. zobrazte anova(object = mod_ostrov).

# Vaše řešení:


# Očekávaný výsledek:
# Referencí je Biscoe (abecedně první), jeho průměr je asi 4 716,0 g.
# Dream je asi o 1 003,1 g a Torgersen asi o 1 009,6 g lehčí. F je asi
# 110,0 při 2 a 339 stupních volnosti.
#
# Nápověda 1:
# Textový sloupec použije R jako faktor s úrovněmi v abecedním pořadí.
#
# Nápověda 2:
# Úrovně zjistíte pomocí levels(x = factor(x = data_tucnaci$ostrov)).
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


# Očekávaný výsledek:
# F je asi 557,6 a t² = 23,61² je také asi 557,6. U dvou skupin dává
# celkový F-test stejnou odpověď jako t-test koeficientu.
#
# Nápověda 1:
# U dvou skupin je jediná dvojice, takže celková a párová otázka splynou.
#
# Nápověda 2:
# Druhou mocninu spočítáte operátorem ^, například 23.61^2.

#----------------------------------------#
### Úloha navíc | L06-N13 -----
#----------------------------------------#

# Průměrný čtverec (MS) je součet čtverců dělený stupni volnosti:
# - mezi skupinami dělíme 2, protože tři průměry popisuje jeden
#   referenční průměr a dva rozdíly;
# - uvnitř skupin dělíme residuálními stupni volnosti, které vrátí
#   df.residual(object = mod_tri_druhy).
# F-statistika je podíl průměrného čtverce mezi skupinami a uvnitř nich.
#
# Zadání:
# Ze součtů čtverců z U08 spočítejte oba průměrné čtverce a jejich podíl
# F. Výsledek porovnejte se sloupci Mean Sq a F value tabulky anova().

# Vaše řešení:


# Očekávaný výsledek:
# Průměrné čtverce jsou asi 73 432 107 a 213 698 g², takže F je asi
# 343,63, stejně jako v tabulce anova().
#
# Nápověda 1:
# Kdyby druh nepomáhal, byl by průměrný čtverec mezi skupinami podobně
# velký jako uvnitř nich a F by bylo kolem 1.
#
# Nápověda 2:
# Mezi skupinami dělte rozdíl SSE dvěma, uvnitř skupin dělte SSE tří
# průměrů výsledkem df.residual(); potom oba výsledky podělte.

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Co znamená intercept, když je referencí Adelie?
# 2. Proč se model se dvěma druhy a dvouvýběrový t-test se společným
#    rozptylem shodují?
# 3. Na jakou otázku odpovídá celkový F-test a na jakou párová
#    porovnání?
# 4. Co znamená Tukeyho interval, který obsahuje nulu?
# 5. Proč tyto údaje samy nedokazují, že druh hmotnost způsobuje?
# Pokud si nejste jistí, vraťte se k úlohám U03, U05, U08, U09 a U10.
#
# Věcný závěr začíná velikostí rozdílů v gramech a jejich nejistotou.
# Test odpovídá na užší otázku: jak slučitelná jsou data se stejnými
# průměry za předpokladů modelu.

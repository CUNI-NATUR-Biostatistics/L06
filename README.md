# L06 — Když prediktor není číslo

**Od rozdílu průměrů k analýze rozptylu**

Tento repozitář obsahuje šestou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Liší se průměrná tělesná hmotnost mezi druhy tučňáků? Šestá lekce ukazuje, že lineární model funguje i tehdy, když prediktorem není číslo, ale příslušnost ke skupině.

Na datech Palmer Penguins začneme porovnáním dvou druhů a poté přidáme třetí. Intercept budeme číst jako průměr referenční skupiny a ostatní koeficienty jako rozdíly vůči této skupině. Dvouskupinový t-test a analýzu rozptylu tak propojíme se stejným modelovým rámcem, který známe z předchozích lekcí.

Vedle celkového testu všech skupin budeme pracovat s navazujícími porovnáními konkrétních dvojic a výsledky vyjádříme v biologicky srozumitelných jednotkách.

## Výsledky učení

Po prostudování této lekce dokážete:

- fitovat model `lm(y ~ skupina)` pro dvě i více skupin;
- vysvětlit, jak se zápis lineárního modelu interpretuje při kategoriálním prediktoru;
- interpretovat intercept jako průměr referenční skupiny a ostatní koeficienty jako rozdíly vůči ní;
- vysvětlit dvouskupinový t-test a analýzu rozptylu jako případy lineárního modelu;
- rozlišit celkový test všech skupin od navazujících porovnání konkrétních dvojic;
- napsat závěr o rozdílech mezi skupinami v biologicky smysluplných jednotkách včetně nejistoty.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L06. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L06/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L06/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L06/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L06/current/presentation/presentation.pdf) |


- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `data/palmer_penguins.csv` je připravený výukový dataset tučňáků.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L06.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L06-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L06/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).

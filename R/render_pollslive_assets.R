library(grid)
library(digest)
library(here)
here::i_am("R/render_pollslive_assets.R")
output_dir <- here::here("pollslive", "assets")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
colours <- c(parchment="#F4F1EC", graphite="#2E2E2E", olive="#8A8A8A", indigo="#5D2890", orange="#F3A712", white="#FFFFFF", light="#F0EDE8")
open_card <- function(filename) {
  grDevices::png(here::here(output_dir, filename), width=1600, height=900, res=160, type="cairo", bg=colours[["parchment"]])
  grid.newpage()
}
close_card <- function() grDevices::dev.off()
draw_title <- function(text) grid.text(text, x=unit(0.07,"npc"), y=unit(0.88,"npc"), just="left", gp=gpar(col=colours[["indigo"]], fontsize=34, fontface="bold"))
draw_panel <- function(y=0.48, height=0.48) grid.roundrect(x=0.5,y=y,width=0.86,height=height,r=unit(0.025,"npc"),gp=gpar(fill=colours[["white"]],col=colours[["light"]],lwd=2))

source_path <- here::here("pollslive","source","pie_crab_site_means.csv")
stopifnot(identical(digest(file=source_path,algo="sha256"),"2280d4bc56723c778c6f52d0440b616d9ee23d180634228f98ce30ed7c047141"))
data_lokality <- read.csv(source_path, stringsAsFactors=FALSE)
mod_krabi <- lm(prumerna_sirka_mm ~ zemepisna_sirka, data=data_lokality)
row <- summary(mod_krabi)$coefficients["zemepisna_sirka",]
ci <- confint(mod_krabi)["zemepisna_sirka",]
open_card("l05-effect-first-conclusion.png")
draw_title("Výsledek pro biologa")
draw_panel(y=0.51,height=0.55)
grid.text(paste0("Efekt: +",formatC(row[["Estimate"]],format="f",digits=2,decimal.mark=",")," mm na 1° severněji"),x=unit(0.12,"npc"),y=unit(0.66,"npc"),just="left",gp=gpar(col=colours[["indigo"]],fontsize=27,fontface="bold"))
grid.text(paste0("95% interval: [",formatC(ci[[1]],format="f",digits=3,decimal.mark=","),"; ",formatC(ci[[2]],format="f",digits=3,decimal.mark=","),"] mm/°"),x=unit(0.12,"npc"),y=unit(0.52,"npc"),just="left",gp=gpar(col=colours[["graphite"]],fontsize=24))
grid.text("Pozorovací studie: závěr popisuje sledované lokality.\nSama neurčuje příčinu.",x=unit(0.12,"npc"),y=unit(0.35,"npc"),just="left",gp=gpar(col=colours[["orange"]],fontsize=21,fontface="bold",lineheight=1.2))
close_card()
expected <- c("l05-p-value-tails.png"="7d0af829f0e0accb6d93121748bbdef8af4b9c717b3f6694cc9555930b43621a","l05-type-i-error.jpg"="c4473f17924c95d164c13d1c82f374540a74cccb1fc6b0eaa00ad1e127260228")
for(filename in names(expected)){path<-here::here(output_dir,filename);stopifnot(file.exists(path),identical(digest(file=path,algo="sha256"),unname(expected[[filename]])))}

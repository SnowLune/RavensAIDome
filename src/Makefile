SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .owh .ow

MODEFILE=../PracticeFieldExpanse.txt

FILES=  \
  main.owh \
  main.ow \
  defines.ow \
  hud.owh \
  hud.ow \
  player.owh \
  player.ow \
  bot.owh \
  bot.ow \
  shared.owh \
  special.ow \
  ai.owh \
  ai.ow \
  ai/ai_Ana.ow \
  ai/ai_Ashe.ow \
  ai/ai_Baptiste.ow \
  ai/ai_Bastion.ow \
  ai/ai_Brigitte.ow \
  ai/ai_Cassidy.ow \
  ai/ai_Doomfist.ow \
  ai/ai_DVa.ow \
  ai/ai_Echo.ow \
  ai/ai_Genji.ow \
  ai/ai_Hanzo.ow \
  ai/ai_Junkrat.ow \
  ai/ai_Lucio.ow \
  ai/ai_Mei.ow \
  ai/ai_Mercy.ow \
  ai/ai_Moira.ow \
  ai/ai_Orisa.ow \
  ai/ai_Pharah.ow \
  ai/ai_Reaper.ow \
  ai/ai_Reinhardt.ow \
  ai/ai_Roadhog.ow \
  ai/ai_Sigma.ow \
  ai/ai_Soldier76.ow \
  ai/ai_Sombra.ow \
  ai/ai_Symmetra.ow \
  ai/ai_Torbjorn.ow \
  ai/ai_Tracer.ow \
  ai/ai_Widowmaker.ow \
  ai/ai_Winston.ow \
  ai/ai_WreckingBall.ow \
  ai/ai_Zarya.ow \
  ai/ai_Zenyatta.ow

$(MODEFILE): $(FILES)
  cat $(FILES) | sed -e 's/\/\/.*$$//' -e 's/\t/    /g' -e '/^\ *$$/d' -e '/^$$/d' > $(MODEFILE)
  cat $(MODEFILE) | clip.exe

clean: 
  rm -f ../PracticeFieldExpanse.txt

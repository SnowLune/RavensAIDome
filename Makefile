SHELL = /bin/bash

.SUFFIXES:
.SUFFIXES: .owh .ow

BUILDDATE=$(shell date -u +%Y%m%d)

MODENAME=ravensaidome
MODEFILE=$(MODENAME).ow.txt

FILES=	\
	src/main.owh \
	src/main.ow \
	src/defines.ow \
	src/hud.owh \
	src/hud.ow \
	src/player.owh \
	src/player.ow \
	src/bot.owh \
	src/bot.ow \
	src/shared.owh \
	src/special.ow \
	src/ai.owh \
	src/ai.ow \
	src/ai/ai_Ana.ow \
	src/ai/ai_Ashe.ow \
	src/ai/ai_Baptiste.ow \
	src/ai/ai_Bastion.ow \
	src/ai/ai_Brigitte.ow \
	src/ai/ai_Cassidy.ow \
	src/ai/ai_Doomfist.ow \
	src/ai/ai_DVa.ow \
	src/ai/ai_Echo.ow \
	src/ai/ai_Genji.ow \
	src/ai/ai_Hanzo.ow \
	src/ai/ai_Junkrat.ow \
	src/ai/ai_Lucio.ow \
	src/ai/ai_Mei.ow \
	src/ai/ai_Mercy.ow \
	src/ai/ai_Moira.ow \
	src/ai/ai_Orisa.ow \
	src/ai/ai_Pharah.ow \
	src/ai/ai_Reaper.ow \
	src/ai/ai_Reinhardt.ow \
	src/ai/ai_Roadhog.ow \
	src/ai/ai_Sigma.ow \
	src/ai/ai_Soldier76.ow \
	src/ai/ai_Sombra.ow \
	src/ai/ai_Symmetra.ow \
	src/ai/ai_Torbjorn.ow \
	src/ai/ai_Tracer.ow \
	src/ai/ai_Widowmaker.ow \
	src/ai/ai_Winston.ow \
	src/ai/ai_WreckingBall.ow \
	src/ai/ai_Zarya.ow \
	src/ai/ai_Zenyatta.ow

$(MODEFILE): $(FILES)
	cat $(FILES) > $(MODEFILE)
	sed -i "s/__BUILDDATE__/$(BUILDDATE)/" $(MODEFILE)
	./tools/overwatch_workshop_minifier.sh $(MODEFILE)

clean: 
	rm -f $(MODEFILE)

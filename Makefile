# Tarmak 1-4 xmodmap file generator
#
# Run 'make' inside this directory to create a bunch of xmodmap files based
# on your current layout, along with another xmodmap file to reset
# back to your current layout

# File names
FILE1=tarmak1.xmodmap
FILE2=tarmak2.xmodmap
FILE3=tarmak3.xmodmap
FILE4=tarmak4.xmodmap
FILER=reset.xmodmap

# Keycodes for letters/symbols in the QWERTY layout
E=26
R=27
T=28
Y=29
O=32
P=33
S=39
D=40
F=41
G=42
J=44
K=45
SC=47
N=57

# Function to swap keycode $(1) to $(2) - and save it to file $(3)
swap =                                                                          \
	xmodmap -pke |                                                              \
		grep "^keycode  *$(2)" |                                                \
		sed "s/keycode  *$(2)/keycode $(1)/" >> $(3);                           \
	grep -v '^keycode *$(1)' $(FILER) > $(FILER).tmp;                           \
	mv $(FILER).tmp $(FILER);                                                   \
	xmodmap -pke |                                                              \
		grep "^keycode  *$(1)" >> $(FILER)

all: tarmak1 tarmak2 tarmak3 tarmak4 endmsg

clean:
	rm -f $(FILE1)
	rm -f $(FILE2)
	rm -f $(FILE3)
	rm -f $(FILE4)
	rm -f $(FILER)

# Tarmak 1: E
tarmak1:
	echo '! Tarmak 1' > $(FILE1)
	echo '! Reset Tarmak 1' >> $(FILER)
# E => J
	$(call swap,$(E),$(J),$(FILE1))
# J => N
	$(call swap,$(J),$(N),$(FILE1))
# K => E
	$(call swap,$(K),$(E),$(FILE1))
# N => K
	$(call swap,$(N),$(K),$(FILE1))

# Tarmak 2: ET
tarmak2: tarmak1
	grep -v '$(G)\|$(E)\|$(F)\|$(T)' $(FILE1) > $(FILE2)
	echo '! Tarmak 2' >> $(FILE2)
	echo '! Reset Tarmak 2' >> $(FILER)
# G => J
	$(call swap,$(G),$(J),$(FILE2))
# E => F
	$(call swap,$(E),$(F),$(FILE2))
# F => T
	$(call swap,$(F),$(T),$(FILE2))
# T => G
	$(call swap,$(T),$(G),$(FILE2))

# Tarmak 3: ETR
tarmak3: tarmak2
	grep -v '$(S)\|$(D)\|$(R)\|$(G)' $(FILE2) > $(FILE3)
	echo '! Tarmak 3' >> $(FILE3)
	echo '! Reset Tarmak 4' >> $(FILER)
# S => R
	$(call swap,$(S),$(R),$(FILE3))
# D => S
	$(call swap,$(D),$(S),$(FILE3))
# R => J
	$(call swap,$(R),$(J),$(FILE3))
# G => D
	$(call swap,$(G),$(D),$(FILE3))

# Tarmak 4: ETRO
tarmak4: tarmak3
	grep -v '$(O)\|$(SC)\|$(P)\|$(R)\|$(Y)' $(FILE3) > $(FILE4)
	echo '! Tarmak 4' >> $(FILE4)
	echo '! Reset Tarmak 4' >> $(FILER)
# O => Y
	$(call swap,$(O),$(Y),$(FILE4))
# ; => O
	$(call swap,$(SC),$(O),$(FILE4))
# P => ;
	$(call swap,$(P),$(SC),$(FILE4))
# R => P
	$(call swap,$(R),$(P),$(FILE4))
# Y => J
	$(call swap,$(Y),$(J),$(FILE4))

endmsg:
	@echo
	@echo "Finished successfully!"
	@echo
	@echo "You can now switch to another layout using one of:"
	@echo
	@echo "   xmodmap $(FILE1)"
	@echo "   xmodmap $(FILE2)"
	@echo "   xmodmap $(FILE3)"
	@echo "   xmodmap $(FILE4)"
	@echo
	@echo "And if you want to reset back to your current (qwerty) layout,"
	@echo "just call this:"
	@echo
	@echo "   xmodmap $(FILER)"
	@echo
	@echo "When you are done with Tarmak 4, run the $(FILER) file and"
	@echo "switch to the Colemak layout using your DE (desktop enviroment)"
	@echo "settings (or run setxkbmap -variant colemak)"
	@echo
	@echo "Tip #1: Open a new terminal window in this folder and type in"
	@echo "        "xmodmap $(FILER)" so that you can just press enter if"
	@echo "        you get cold feet."
	@echo
	@echo "Tip #2: Do a \"ln -s $(FILE1) ~/.Xmodmap\" to run $(FILE1)"
	@echo "        when you log in."
	@echo

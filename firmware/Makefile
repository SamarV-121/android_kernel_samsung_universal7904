#
# kbuild file for firmware/
#

CONFIG_EXTRA_FIRMWARE_DIR="firmware"

# Create $(fwabs) from $(CONFIG_EXTRA_FIRMWARE_DIR) -- if it doesn't have a
# leading /, it's relative to $(srctree).
fwdir := $(subst $(quote),,$(CONFIG_EXTRA_FIRMWARE_DIR))
fwabs := $(addprefix $(srctree)/,$(filter-out /%,$(fwdir)))$(filter /%,$(fwdir))

fw-external-y := $(subst $(quote),,$(CONFIG_EXTRA_FIRMWARE))

# ACPM firmware
fw-external-$(CONFIG_EXYNOS8890_APM) += apm_8890_evt1.h
ifdef CONFIG_SOC_EMULATOR8895
fw-external-$(CONFIG_EXYNOS8895_ACPM) += emulator8895_acpm_dvfs.fw
else
fw-external-$(CONFIG_EXYNOS8895_ACPM) += exynos8895_acpm_dvfs.fw
endif
fw-external-$(CONFIG_EXYNOS7872_ACPM) += exynos7872_acpm_dvfs.fw
fw-external-$(CONFIG_EXYNOS7872_ACPM) += exynos7872_acpm_fvp.fw
fw-external-$(CONFIG_EXYNOS7885_ACPM) += exynos7885_acpm_fvp.fw

# Touchscreen Firmware
fw-external-$(CONFIG_TOUCHSCREEN_MXT540E) += tsp_atmel/mXT540E.fw
fw-external-$(CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_DSX) += tsp_synaptics/synaptics_b0_h.fw
fw-external-$(CONFIG_TOUCHSCREEN_FTS) += tsp_stm/fts6ct108_view2.fw
fw-external-$(CONFIG_TOUCHSCREEN_FTS1BA90A) += tsp_stm/fts1ba90a_gta3_00.fw tsp_stm/fts1ba90a_gta3.fw
fw-external-$(CONFIG_TOUCHSCREEN_MELFAS_MMS449) += tsp_melfas/mms449_s5neo.fw
fw-external-$(CONFIG_TOUCHSCREEN_MELFAS_MMS438) += tsp_melfas/mms438_j7duo.fw
ifdef CONFIG_TOUCHSCREEN_MELFAS_MSS100
fw-external-$(CONFIG_TOUCHSCREEN_MELFAS_MSS100) += tsp_melfas/mss100_m30_00.fw tsp_melfas/mss100_m30.fw tsp_melfas/mss100_m30_old.fw \
													tsp_melfas/mss100_a30.fw tsp_melfas/mss100_a30_old.fw tsp_melfas/mss100_a30_jpn.fw
else
fw-external-$(CONFIG_TOUCHSCREEN_MELFAS_MSS100_A30KOR) += tsp_melfas/mss100_a30.fw tsp_melfas/mss100_a30_old.fw
endif
fw-external-$(CONFIG_TOUCHSCREEN_MMS144) += tsp_melfas/DIABLO_CoreV54_V35_master.fw
fw-external-$(CONFIG_TOUCHSCREEN_CYPRESS_CYTTSP5) += cyttsp5_csp.fw
fw-external-$(CONFIG_TOUCHSCREEN_SEC_TS_A552) += tsp_sec/hero2la.bin
fw-external-$(CONFIG_TOUCHSCREEN_SEC_TS) += tsp_sec/y661_a5y18.fw tsp_sec/y661_a7y18.fw
fw-external-$(CONFIG_TOUCHSCREEN_SEC_INCELL_TS) += tsp_sec/s6d7at01a01_j7topelte.fw tsp_sec/s6d7at0b01_a10.fw tsp_sec/s6d7at0b01_a10_boe.fw
fw-external-$(CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_TD4X00) += tsp_synaptics/td4100_j3poplte.fw tsp_synaptics/td4100_j3poplte_recovery.fw \
														tsp_synaptics/td4100_j7pop.fw tsp_synaptics/td4100_j7pop_recovery.fw \
														tsp_synaptics/td4100_j3top.fw tsp_synaptics/td4100_j3top_recovery.fw
fw-external-$(CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_TD4X00_J2CORESPR) += tsp_synaptics/td4101_j2corepelte_spr.fw tsp_synaptics/td4101_j2corepelte_spr_recovery.fw
fw-external-$(CONFIG_TOUCHSCREEN_IST40XX) += tsp_imagis/ist40xx_a7_2018.fw tsp_imagis/ist40xx_a7_2018_cmcs.bin \
											tsp_imagis/ist40xx_a50.fw tsp_imagis/ist40xx_a50_cmcs.bin
fw-external-$(CONFIG_TOUCHSCREEN_IST4050) += tsp_imagis/ist40xx_a30s.bin tsp_imagis/ist40xx_a30s_cmcs.bin
fw-external-$(CONFIG_TOUCHSCREEN_IST3038H) += tsp_imagis/ist3038h_a40.fw tsp_imagis/ist3038h_a40_cmcs.bin
fw-external-$(CONFIG_TOUCHSCREEN_HIMAX_INCELL) += tsp_himax/hx83112a_m20lte.fw
fw-external-$(CONFIG_TOUCHSCREEN_HIMAX_CHIPSET) += tsp_himax/hx83102p_gta4s.fw

TSPFIRMWARE_DIRECTORY = $(srctree)/firmware/tsp_zinitix
ifeq ($(shell test -d $(TSPFIRMWARE_DIRECTORY) && echo yes),yes)
fw-external-$(CONFIG_TOUCHSCREEN_ZINITIX_ZT75XX) += tsp_zinitix/zt7538_xcover4s.fw
fw-external-$(CONFIG_TOUCHSCREEN_ZINITIX_ZT75XX_TCLM) += tsp_zinitix/zt7548_a6.fw tsp_zinitix/zt7548_feel2.fw tsp_zinitix/zt7548_a40.fw tsp_zinitix/zt7548_a20.fw tsp_zinitix/zt7548_a40s.fw tsp_zinitix/zt7548_m10s.fw
fw-external-$(CONFIG_TOUCHSCREEN_ZINITIX_ZT75XX_WISDOM) +=tsp_zinitix/zt7548_wisdom.fw
else
$(warning '$(TSPFIRMWARE_DIRECTORY)' directory dose not exist)
endif

fw-external-$(CONFIG_EPEN_WACOM_W9019) += epen/w9019_wisdom.fw

# TouchKey Firmware
fw-external-$(CONFIG_KEYBOARD_TC300K) += coreriver/tc305k_j7topelte.fw coreriver/tc350k_j3top.fw \
										coreriver/tc350k_j7duo.fw coreriver/tc350k_j7duo_rev04.fw
#touch based grip sensor
fw-external-$(CONFIG_SENSORS_TC3XXK_A7Y18LTE) += coreriver/tc305k_a7y18lte_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_M20) += coreriver/tc305k_m20_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_M30) += coreriver/tc305k_m30_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A40) += coreriver/tc305k_a40_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A30) += coreriver/tc305k_a30_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A30_JPN) += coreriver/tc305k_a30_jpn_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A20) += coreriver/tc305k_a20_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A20E) += coreriver/tc305k_a20e_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A10) += coreriver/tc305k_a10_grip.fw coreriver/tc305k_a10_eur_kor.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A10E) += coreriver/tc305k_a10e_grip.fw
fw-external-$(CONFIG_SENSORS_TC3XXK_A10E_KOR) += coreriver/tc305k_a10e_kor.fw
fw-external-$(CONFIG_SENSORS_A96T3X6) += abov/a96t346_a6elte.fw abov/a96t326_jackpotvelte.fw abov/a96t346_xcover4s.fw
fw-external-$(CONFIG_SENSORS_A96T3X6_A40) += abov/a96t346_a405f.fw abov/a96t346_a405s.fw
fw-external-$(CONFIG_SENSORS_A96T3X6_A30) += abov/a96t346_a305j.fw
fw-external-$(CONFIG_SENSORS_A96T3X6_A30S) += abov/a96t356_a30s.fw
fw-external-$(CONFIG_SENSORS_A96T3X6_VIEW2) += abov/a96t346_gview2lte.fw

#Sensor Hub
fw-external-$(CONFIG_SENSORS_SSP_STM32) += ssp_stmf410_a2018.fw
fw-external-$(CONFIG_SENSORS_SSP_STM32) += ssp_stmf410_a2018_O.fw
fw-external-$(CONFIG_SENSORS_SSP_STM32) += ssp_stmf410_a2018_P.fw
fw-external-$(CONFIG_SENSORS_SSP_STM32) += ssp_crashed.fw

fw-external-$(CONFIG_KEYBOARD_ABOV_TOUCH_3X6) += abov/a96t326_a5y18.fw abov/a96t326_a5y18_can.fw abov/a96t326_a7y18.fw

fw-external-all := $(fw-external-y) $(fw-external-m) $(fw-external-)

quiet_cmd_ihex  = IHEX    $@
      cmd_ihex  = $(OBJCOPY) -Iihex -Obinary $< $@

quiet_cmd_ihex2fw  = IHEX2FW $@
      cmd_ihex2fw  = $(objtree)/$(obj)/ihex2fw $< $@

quiet_cmd_h16tofw  = H16TOFW $@
      cmd_h16tofw  = $(objtree)/$(obj)/ihex2fw -w $< $@

quiet_cmd_fwbin = MK_FW   $@
      cmd_fwbin = FWNAME="$(patsubst firmware/%.gen.S,%,$@)";		     \
		  FWSTR="$(subst /,_,$(subst .,_,$(subst -,_,$(patsubst	     \
				firmware/%.gen.S,%,$@))))";		     \
		  ASM_WORD=$(if $(CONFIG_64BIT),.quad,.long);		     \
		  ASM_ALIGN=$(if $(CONFIG_64BIT),3,2);			     \
		  PROGBITS=$(if $(CONFIG_ARM),%,@)progbits;		     \
		  echo "/* Generated by firmware/Makefile */"		> $@;\
		  echo "    .section .rodata"				>>$@;\
		  echo "    .p2align 4"					>>$@;\
		  echo "_fw_$${FWSTR}_bin:"				>>$@;\
		  echo "    .incbin \"$(2)\""				>>$@;\
		  echo "_fw_end:"					>>$@;\
		  echo "   .section .rodata.str,\"aMS\",$${PROGBITS},1"	>>$@;\
		  echo "    .p2align $${ASM_ALIGN}"			>>$@;\
		  echo "_fw_$${FWSTR}_name:"				>>$@;\
		  echo "    .string \"$$FWNAME\""			>>$@;\
		  echo "    .section .builtin_fw,\"a\",$${PROGBITS}"	>>$@;\
		  echo "    .p2align $${ASM_ALIGN}"			>>$@;\
		  echo "    $${ASM_WORD} _fw_$${FWSTR}_name"		>>$@;\
		  echo "    $${ASM_WORD} _fw_$${FWSTR}_bin"		>>$@;\
		  echo "    $${ASM_WORD} _fw_end - _fw_$${FWSTR}_bin"	>>$@;

# One of these files will change, or come into existence, whenever
# the configuration changes between 32-bit and 64-bit. The .S files
# need to change when that happens.
wordsize_deps := $(wildcard include/config/64bit.h include/config/32bit.h \
		include/config/ppc32.h include/config/ppc64.h \
		include/config/superh32.h include/config/superh64.h \
		include/config/x86_32.h include/config/x86_64.h \
		firmware/Makefile)

$(patsubst %,$(obj)/%.gen.S, $(fw-external-y)): %: $(wordsize_deps)
	$(call cmd,fwbin,$(fwabs)/$(patsubst $(obj)/%.gen.S,%,$@))

# The .o files depend on the binaries directly; the .S files don't.
$(patsubst %,$(obj)/%.gen.o, $(fw-external-y)): $(obj)/%.gen.o: $(fwdir)/%

# .ihex is used just as a simple way to hold binary files in a source tree
# where binaries are frowned upon. They are directly converted with objcopy.
$(obj)/%: $(obj)/%.ihex
	$(call cmd,ihex)

obj-y				 += $(patsubst %,%.gen.o, $(fw-external-y))

ifeq ($(KBUILD_SRC),)
# Makefile.build only creates subdirectories for O= builds, but external
# firmware might live outside the kernel source tree
_dummy := $(foreach d,$(addprefix $(obj)/,$(dir $(fw-external-y))), $(shell [ -d $(d) ] || mkdir -p $(d)))
endif

targets := $(patsubst $(obj)/%,%, \
                                $(shell find $(obj) -name \*.gen.S 2>/dev/null))
# Without this, built-in.o won't be created when it's empty, and the
# final vmlinux link will fail.
obj- := dummy

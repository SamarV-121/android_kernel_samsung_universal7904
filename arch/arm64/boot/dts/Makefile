# SPDX-License-Identifier: GPL-2.0
dtb-$(CONFIG_EXYNOS7904_M20LTE_SWA_OPEN) += exynos/exynos7904-m20lte_swa_open_04.dtb
dtb-$(CONFIG_EXYNOS7904_M30LTE_SWA_OPEN) += \
	exynos/exynos7904-m30lte_swa_open_00.dtb \
	exynos/exynos7904-m30lte_swa_open_01.dtb \
	exynos/exynos7904-m30lte_swa_open_03.dtb \
	exynos/exynos7904-m30lte_swa_open_04.dtb


dtb-$(CONFIG_EXYNOS7904_GTA3XLWIFI_EUR_OPEN) += exynos/dtbo/exynos7885.dtb


dtbo-$(CONFIG_EXYNOS7904_GTA3XLWIFI_EUR_OPEN) += \
	exynos/exynos7904-gta3xlwifi_eur_open_04.dtbo \
	exynos/exynos7904-gta3xlwifi_eur_open_03.dtbo
	
targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*

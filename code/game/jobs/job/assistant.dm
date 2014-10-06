/datum/job/marine
	title = "Marine"
	flag = MARINE
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()

/datum/job/marine/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/marine(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/device/radio/marine(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
	return 1

/datum/job/marine/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()

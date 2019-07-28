/obj/item/weapon/gun/energy/pulse_rifle
	name = "pulse rifle"
	desc = "A heavy-duty, pulse-based energy weapon, preferred by front-line combat personnel."
	icon_state = "pulse"
	item_state = "pulse"
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)
	cell_type = "/obj/item/weapon/stock_parts/cell/super"
	var/mode = 2
	fire_delay = 25

/obj/item/weapon/gun/energy/pulse_rifle/attack_self(mob/living/user)
	select_fire(user)

/obj/item/weapon/gun/energy/pulse_rifle/isHandgun()
	return 0

/obj/item/weapon/gun/energy/pulse_rifle/cyborg/newshot()
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		if(R && R.cell)
			var/obj/item/ammo_casing/energy/shot = ammo_type[select] //Necessary to find cost of shot
			if(R.cell.use(shot.e_cost))
				chambered = shot
				chambered.newshot()
	return
/*
/obj/item/weapon/gun/energy/pulse_rifle/cyborg/process_chambered()
	if(in_chamber)
		return 1
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		if(R && R.cell)
			R.cell.use(charge_cost)
			in_chamber = new/obj/item/projectile/beam(src)
			return 1
	return 0 */

/obj/item/weapon/gun/energy/pulse_rifle/destroyer
	name = "pulse destroyer"
	desc = "A heavy-duty, pulse-based energy weapon."
	cell_type = "/obj/item/weapon/stock_parts/cell/infinite"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse)

/obj/item/weapon/gun/energy/pulse_rifle/destroyer/attack_self(mob/living/user)
	to_chat(user, "<span class='warning'>[src.name] has three settings, and they are all DESTROY.</span>")

/obj/item/weapon/gun/energy/pulse_rifle/M1911
	name = "m1911-P"
	desc = "It's not the size of the gun, it's the size of the hole it puts through people."
	icon_state = "m1911-p"
	item_state = "gun"
	cell_type = "/obj/item/weapon/stock_parts/cell/infinite"

/obj/item/weapon/gun/energy/pulse_rifle/M1911/isHandgun()
	return 1

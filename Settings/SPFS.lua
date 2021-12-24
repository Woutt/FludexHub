local table = {
	num = {--[["", ]]"K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "N", "Dc", "Ud", "Dd", "Td", "Qua", "Qui", "Sxd", "Spd", "Ocd", "Nod", "Vg", "Uvg", "Dvg", "Tvg", "qtV", "QnV", "SeV", "SPG", "OVG", "NVG", "TGN", "UTG", "DTG", "tsTG", "qtTG", "QnTG", "ssTG", "SpTG", "OcTG", "NoAG", "UnAG", "DuAG", "TeAG", "QdAG", "QnAG", "SxAG", "SpAG", "OcAG", "NvAG", "CT"},
	None = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	Safezone = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	CorruptedForest = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	JungleArena = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	GlacialOutpost = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	IceArena = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	VolcanicRuins = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	VolcanoArena = {
		Stat = "All", 
		Requirement = 0, 
		Boost = 1
	}, 
	Rock = {
		Stat = "Strength", 
		Requirement = 100, 
		Boost = 2
	}, 
	PunchingBag = {
		Stat = "Strength", 
		Requirement = 1000, 
		Boost = 5
	}, 
	Car = {
		Stat = "Strength", 
		Requirement = 10000, 
		Boost = 20
	}, 
	Construction = {
		Stat = "Strength", 
		Requirement = 100000, 
		Boost = 100
	}, 
	Meteor = {
		Stat = "Strength", 
		Requirement = 5000000, 
		Boost = 750
	}, 
	Crystals = {
		Stat = "Strength", 
		Requirement = 500000000, 
		Boost = 10000
	}, 
	Scorpions = {
		Stat = "Strength", 
		Requirement = 50000000000, 
		Boost = 120000
	}, 
	Sphinx = {
		Stat = "Strength", 
		Requirement = 30000000000000, 
		Boost = 3000000
	}, 
	Pearl = {
		Stat = "Strength", 
		Requirement = 10000000000000000, 
		Boost = 100000000
	}, 
	Statue = {
		Stat = "Strength", 
		Requirement = 2.5E+19, 
		Boost = 3000000000
	}, 
	GoldenPunchingBag = {
		Stat = "Strength", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	PrisonWeapons = {
		Stat = "Strength", 
		Requirement = 5E+30, 
		Boost = 2500000000000
	}, 
	Dummy = {
		Stat = "Strength", 
		Requirement = 1E+35, 
		Boost = 75000000000000
	}, 
	KnightDummy = {
		Stat = "Strength", 
		Requirement = 6E+39, 
		Boost = 2250000000000000
	}, 
	BluePlanet = {
		Stat = "Strength", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	Sun = {
		Stat = "Strength", 
		Requirement = 1.5E+50, 
		Boost = 3E+18
	}, 
	Satellite = {
		Stat = "Strength", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	Rocket = {
		Stat = "Strength", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	OrangeUFO = {
		Stat = "Strength", 
		Requirement = 4E+55, 
		Boost = 3.3E+18
	}, 
	PinkUFO = {
		Stat = "Strength", 
		Requirement = 3E+57, 
		Boost = 3.6E+18
	}, 
	FrostPlanet = {
		Stat = "Strength", 
		Requirement = 9E+59, 
		Boost = 3E+20
	}, 
	GodStar = {
		Stat = "Strength", 
		Requirement = 6.3E+64, 
		Boost = 3E+22
	}, 
	SpaceRock = {
		Stat = "Strength", 
		Requirement = 4E+69, 
		Boost = 7.5E+24
	}, 
	DivinePlanet = {
		Stat = "Strength", 
		Requirement = 8.2E+75, 
		Boost = 1E+27
	}, 
	Ambulance = {
		Stat = "Endurance", 
		Requirement = 100, 
		Boost = 2
	}, 
	Gym = {
		Stat = "Endurance", 
		Requirement = 1000, 
		Boost = 5
	}, 
	Warehouse = {
		Stat = "Endurance", 
		Requirement = 10000, 
		Boost = 20
	}, 
	Carrier = {
		Stat = "Endurance", 
		Requirement = 100000, 
		Boost = 100
	}, 
	Factory = {
		Stat = "Endurance", 
		Requirement = 5000000, 
		Boost = 750
	}, 
	ToxicFactory = {
		Stat = "Endurance", 
		Requirement = 500000000, 
		Boost = 10000
	}, 
	Quicksand = {
		Stat = "Endurance", 
		Requirement = 50000000000, 
		Boost = 120000
	}, 
	Dustdevil = {
		Stat = "Endurance", 
		Requirement = 30000000000000, 
		Boost = 3000000
	}, 
	Dolphins = {
		Stat = "Endurance", 
		Requirement = 10000000000000000, 
		Boost = 100000000
	}, 
	Shark = {
		Stat = "Endurance", 
		Requirement = 2.5E+19, 
		Boost = 3000000000
	}, 
	CursedStorage = {
		Stat = "Endurance", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	DeathPool = {
		Stat = "Endurance", 
		Requirement = 5E+30, 
		Boost = 2500000000000
	}, 
	SpikePit = {
		Stat = "Endurance", 
		Requirement = 1E+35, 
		Boost = 75000000000000
	}, 
	LavaPit = {
		Stat = "Endurance", 
		Requirement = 6E+39, 
		Boost = 2250000000000000
	}, 
	Tornado = {
		Stat = "Endurance", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	Thunderstorm = {
		Stat = "Endurance", 
		Requirement = 1.5E+50, 
		Boost = 3E+18
	}, 
	RadioactiveMeteors = {
		Stat = "Endurance", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	GravityChamber = {
		Stat = "Endurance", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	UFOBeam = {
		Stat = "Endurance", 
		Requirement = 4E+55, 
		Boost = 3.3E+18
	}, 
	AcidPool = {
		Stat = "Endurance", 
		Requirement = 3E+57, 
		Boost = 3.6E+18
	}, 
	FrostTornado = {
		Stat = "Endurance", 
		Requirement = 9E+59, 
		Boost = 3E+20
	}, 
	Blizzard = {
		Stat = "Endurance", 
		Requirement = 6.3E+64, 
		Boost = 3E+22
	}, 
	LavaLake = {
		Stat = "Endurance", 
		Requirement = 4E+69, 
		Boost = 7.5E+24
	}, 
	Wormhole = {
		Stat = "Endurance", 
		Requirement = 8.2E+75, 
		Boost = 1E+27
	}, 
	Library = {
		Stat = "Psychic", 
		Requirement = 1000, 
		Boost = 5
	}, 
	GoldenBookcase = {
		Stat = "Psychic", 
		Requirement = 10000, 
		Boost = 20
	}, 
	Sewer = {
		Stat = "Psychic", 
		Requirement = 100000, 
		Boost = 100
	}, 
	DivineTree = {
		Stat = "Psychic", 
		Requirement = 5000000, 
		Boost = 750
	}, 
	Lighthouse = {
		Stat = "Psychic", 
		Requirement = 500000000, 
		Boost = 10000
	}, 
	MagicWell = {
		Stat = "Psychic", 
		Requirement = 50000000000, 
		Boost = 120000
	}, 
	Temple = {
		Stat = "Psychic", 
		Requirement = 30000000000000, 
		Boost = 3000000
	}, 
	AtlantisTemple = {
		Stat = "Psychic", 
		Requirement = 10000000000000000, 
		Boost = 100000000
	}, 
	Jellyfish = {
		Stat = "Psychic", 
		Requirement = 2.5E+19, 
		Boost = 3000000000
	}, 
	PrisonPapers = {
		Stat = "Psychic", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	GoldenHelipad = {
		Stat = "Psychic", 
		Requirement = 5E+30, 
		Boost = 2500000000000
	}, 
	MeditationArea = {
		Stat = "Psychic", 
		Requirement = 1E+35, 
		Boost = 75000000000000
	}, 
	Waterfall = {
		Stat = "Psychic", 
		Requirement = 6E+39, 
		Boost = 2250000000000000
	}, 
	GoldenTree = {
		Stat = "Psychic", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	GoldenTemple = {
		Stat = "Psychic", 
		Requirement = 1.5E+50, 
		Boost = 3E+18
	}, 
	EnergyTemple = {
		Stat = "Psychic", 
		Requirement = 1E+25, 
		Boost = 90000000000
	}, 
	EnergyTower = {
		Stat = "Psychic", 
		Requirement = 1.5E+44, 
		Boost = 75000000000000000
	}, 
	KnowledgeBeam = {
		Stat = "Psychic", 
		Requirement = 4E+55, 
		Boost = 3.3E+18
	}, 
	KnowledgeTower = {
		Stat = "Psychic", 
		Requirement = 3E+57, 
		Boost = 3.6E+18
	}, 
	PsychicCrystals = {
		Stat = "Psychic", 
		Requirement = 9E+59, 
		Boost = 3E+20
	}, 
	PsychicBeam = {
		Stat = "Psychic", 
		Requirement = 6.3E+64, 
		Boost = 3E+22
	}, 
	GodTree = {
		Stat = "Psychic", 
		Requirement = 4E+69, 
		Boost = 7.5E+24
	}, 
	Blackhole = {
		Stat = "Psychic", 
		Requirement = 8.2E+75, 
		Boost = 1E+27
	}
}
return table

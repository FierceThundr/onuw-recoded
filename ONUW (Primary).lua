--[[
  Things to think about
	--UI for roles
	----Marksman
	----Sentinel
	----Alpha Wolf/Temptress
	----Mystic Wolf/Dr.Peeker
	----Apprentice Seer/Rapscallion
	----P.I
	----Witch/Voodoo Lou
	----Revealer/Flipper
	----Curator
	----Seer/Detector
	----Robber/Role Retriever
	----Drunk
	----Squire
	----Beholder
	----TARGET ARRAYS

	-----Empath -- done?
	-----Rascal --
	-----Body Snatcher
	-----Oracle? --playernum?
	-----Alien
	-----Psychic
	-----Mortician
	--randomization text
--]]

rippleRandTable = {}
rippleRandTable[1] = {0, 5, 5} 
rippleRandTable[2] = {5, 5, 10}
rippleRandTable[3] = {10, 5, 15}
rippleRandTable[4] = {15, 5, 20}
rippleRandTable[5] = {20, 5, 25}
rippleRandTable[6] = {25, 5, 30}
rippleRandTable[7] = {30, 5, 35}
rippleRandTable[8] = {35, 5, 40}
rippleRandTable[9] = {40, 5, 45}
rippleRandTable[10] = {45, 5, 50}
rippleRandTable[11] = {50, 5, 55}
rippleRandTable[12] = {55, 5, 60}
rippleRandTable[13] = {60, 0, 60}
rippleRandTable[14] = {60, 5, 65}
rippleRandTable[15] = {65, 5, 70}
rippleRandTable[16] = {70, 5, 75}
rippleRandTable[17] = {75, 0, 75}
rippleRandTable[18] = {75, 5, 80}
rippleRandTable[19] = {80, 20, 100}
oracleRandTable = {}
oracleRandTable[1] = {0, 15, 15}
oracleRandTable[2] = {15, 15, 30}
oracleRandTable[3] = {30, 15, 45}
oracleRandTable[4] = {45, 0, 45}
oracleRandTable[5] = {45, 10, 55}
oracleRandTable[6] = {55, 10, 65}
oracleRandTable[7] = {65, 10, 75}
oracleRandTable[8] = {75, 10, 85}
oracleRandTable[9] = {85, 10, 95}
oracleRandTable[10] = {95, 5, 100}
alienRandTable = {}
alienRandTable[1] = {0, 30, 30}
alienRandTable[2] = {30, 30, 60}
alienRandTable[3] = {60, 15, 75}
alienRandTable[4] = {75, 5, 80}
alienRandTable[5] = {80, 5, 85}
alienRandTable[6] = {85, 5, 90}
alienRandTable[7] = {90, 10, 100}
alienRandTable[8] = {100, 0, 100}
alienRandTable[9] = {100, 0, 100}
bodySnatcherRandTable = {}
bodySnatcherRandTable[1] = {0, 85, 85}
bodySnatcherRandTable[2] = {85, 15, 100}
bodySnatcherRandTable[3] = {100, 0, 100}
psychicRandTable = {}
psychicRandTable[1] = {0, 100, 100}
psychicRandTable[2] = {100, 0, 100}
rascalRandTable = {}
rascalRandTable[1] = {0, 30, 30}
rascalRandTable[2] = {30, 0, 30}
rascalRandTable[3] = {30, 0, 30}
rascalRandTable[4] = {30, 40, 70}
rascalRandTable[5] = {70, 30, 100}
exposerRandTable = {}
exposerRandTable[1] = {0, 75, 75}
exposerRandTable[2] = {75, 20, 95}
exposerRandTable[3] = {95, 5, 100}
empathRandTable = {}
empathRandTable[1] = {0, 25, 25}
empathRandTable[2] = {25, 25, 50}
empathRandTable[3] = {50, 25, 75}
empathRandTable[4] = {75, 25, 100}
morticianRandTable = {}
morticianRandTable[1] = {0, 5, 5}
morticianRandTable[2] = {5, 70, 75}
morticianRandTable[3] = {75, 25, 100}
usurpattempted = false
centerVoteEnabled = false


function onLoad()
  empathPlayers = {}

  EZUIrole = {
	{'Sentinel1' , 'Sentinel', 'fil_ONUWD'},
	{'Oracle','Oracle','fil_ONUA'},
	{'Copycat','Copycat','fil_ONUV'},
  {'Mirror Man','Mirror Man','fil_ONUSV'},
	{'Doppelganger1' ,'Doppelganger', 'fil_ONUW'},
  {'Vampire','Vampire','fil_ONUV'},
  {'The Master','The Master','fil_ONUV'},
  {'The Count','The Count','fil_ONUV'},
  {'Renfield','Renfield','fil_ONUV'},
  {'Diseased','Diseased','fil_ONUV'},
  {'Cupid','Cupid','fil_ONUV'},
  {'Instigator','Instigator','fil_ONUV'},
  {'Priest','Priest','fil_ONUV'},
  {'Assassin','Assassin','fil_ONUV'},
  {'Apprentice Assassin','Apprentice Assassin','fil_ONUV'},
  {'Sentinel2' , 'Sentinel', 'fil_ONUWD'},
	{'Alienz1','Alien','fil_ONUA'},
	{'Alienz2','Alien','fil_ONUA'},
	{'Synthetic Alien','Synthetic Alien','fil_ONUA'},
	{'Cow','Cow','fil_ONUA'},
	{'Groob','Groob','fil_ONUA'},
	{'Zerb','Zerb','fil_ONUA'},
	{'Body Snatcher','Body Snatcher','fil_ONUBR'},
  {'Temptress','Temptress','fil_ONUSV'},
  {'Dr. Peeker','Dr. Peeker','fil_ONUSV'},
  {'Rapscallion','Rapscallion','fil_ONUSV'},
  {'Henchman #7','Henchman #7','fil_ONUSV'},
  {'Evilometer','Evilometer','fil_ONUSV'},
  {'Werewolf2' , 'Werewolf', 'fil_ONUW'},
  {'Werewolf3' , 'Werewolf', 'fil_ONUW'},
  {'Alpha Wolf' , 'Alpha Wolf', 'fil_ONUWD'},
  {'Mystic Wolf' , 'Mystic Wolf', 'fil_ONUWD'},
  {'Minion4' , 'Minion', 'fil_ONUW'},
  {'Apprentice Tanner' , 'Apprentice Tanner', 'fil_ONUBR'},
	{'Leader','Leader','fil_ONUA'},
  {'Mad Scientist','Mad Scientist','fil_ONUSV'},
  {'Intern','Intern','fil_ONUSV'},
  {'Mason5' , 'Mason', 'fil_ONUW'},
  {'Mason6' , 'Mason', 'fil_ONUW'},
  {'Thing' , 'Thing', 'fil_ONUBR'},
  {'Annoying Lad','Annoying Lad','fil_ONUSV'},
  {'Seer7' , 'Seer', 'fil_ONUW'},
  {'Apprentice Seer' , 'Apprentice Seer', 'fil_ONUWD'},
  {'Paranormal Investigator' , 'Paranormal Investigator', 'fil_ONUWD'},
  {'Marksman','Marksman','fil_ONUV'},
	{'Nostradamus','Nostradamus','fil_ONUBR'},
	{'Psychic','Psychic','fil_ONUA'},
    {'Detector','Detector','fil_ONUSV'},
    {'Robber8' , 'Robber', 'fil_ONUW'},
    {'Witch' , 'Witch', 'fil_ONUWD'},
    {'Pickpocket','Pickpocket','fil_ONUV'},
    {'Role Retriever','Role Retriever','fil_ONUSV'},
    {'Voodoo Lou','Voodoo Lou','fil_ONUSV'},
    {'Troublemaker9' , 'Troublemaker', 'fil_ONUW'},
    {'Village Idiot' , 'Village Idiot', 'fil_ONUWD'},
    {'Aura Seer' , 'Aura Seer' , 'fil_ONUBR'},
    {'Gremlin','Gremlin','fil_ONUV'},
	{'Rascal','Rascal','fil_ONUA'},
    {'Switcheroo','Switcheroo','fil_ONUSV'},
    {'Drunk10' , 'Drunk', 'fil_ONUW'},
    {'Insomniac11' , 'Insomniac', 'fil_ONUW'},
    {'Self-Awareness Girl','Self-Awareness Girl','fil_ONUSV'},
    {'Squire' , 'Squire', 'fil_ONUBR'},
	{'Family Man' , 'Family Man' , 'fil_ONUBR'},
    {'Beholder' , 'Beholder', 'fil_ONUBR'},
    {'Revealer' , 'Revealer', 'fil_ONUWD'},
	{'Exposer','Exposer','fil_ONUA'},
    {'Flipper' , 'Flipper', 'fil_ONUSV'},
	{'Empath','Empath','fil_ONUBR'},
    {'Curator' , 'Curator', 'fil_ONUWD'},
	{'Blob','Blob','fil_ONUA'},
	{'Mortician','Mortician','fil_ONUA'},
    {'Hunter12' , 'Hunter', 'fil_ONUW'},
    {'Tanner13' , 'Tanner', 'fil_ONUW'},
    {'Villager14' , 'Villager', 'fil_ONUW'},
    {'Villager15' , 'Villager', 'fil_ONUW'},
    {'Villager16' , 'Villager', 'fil_ONUW'},
    {'Dream Wolf' , 'Dream Wolf', 'fil_ONUWD'},
    {'Bodyguard' , 'Bodyguard', 'fil_ONUWD'},
    {'Cursed' , 'Cursed' , 'fil_ONUBR'},
    {'Prince' , 'Prince' , 'fil_ONUBR'}, 
	{'The Sponge' , 'The Sponge' , 'fil_ONUBR'},
	{'Ricochet Rhino' , 'Ricochet Rhino' , 'fil_ONUBR'},
	{'Defender-er' , 'Defender-er' , 'fil_ONUBR'},
	{'Windy Wendy' , 'Windy Wendy' , 'fil_ONUBR'},
	{'Innocent Bystander','Innocent Bystander','fil_ONUSV'},
	{'Innocent Bystander2' , 'Innocent Bystander2' , 'fil_ONUBR'},
    }

    startingXML = makeRoleUI()
    UI.setXml(startingXML)
    persistentXML=''
    clearVectorPaint()
	cardswithtext = {}
    Global.setDecals({})
    claims = {}
    timeleft = 0
    reset_object = getObjectFromGUID('8f8697')
    reset_object.interactable = false
    currentTimerID = 0
    roletokentraker = {}
    night_phase = false
    all_sleep = false

    bg_speaker = getObjectFromGUID('640754')
    bg_speaker.AssetBundle.playLoopingEffect(0)
    bit_speaker = getObjectFromGUID('cd6149')
    bit_speaker2 = getObjectFromGUID('ef6f98')
	bit_speaker3 = getObjectFromGUID('bb6f28')
	bit_speaker4 = getObjectFromGUID('3b8ceb')
    bg_speaker.interactable = false
    bit_speaker.interactable = false
    bit_speaker2.interactable = false
    bit_speaker3.interactable = false
    bit_speaker4.interactable = false
    countdown = getObjectFromGUID('bd6d1b')
    countdown.interactable = false
    displaytable = getObjectFromGUID('3f61b2')
    displaytable.interactable = false
    displaytablee = getObjectFromGUID('fa0c0f')
    displaytablee.interactable = false
    numplayers = 0
    timeperturn = 10
    timerset = false
    VIxml = ''
    MMXml = ''
    ThingXml = ''
    Gxml = ''
    SwapXml = ''
	OracleXml = ''
    cards_used_in_game = {}
    marks_used_in_game = {}
    --[[list of all roles]]

	targToSound = {}
	targToSound[1] = {1.123, 104}
	targToSound[2] = {1.149, 105}
	targToSound[3] = {1.071, 106}
	targToSound[4] = {1.202, 107}
	targToSound[5] = {1.358, 108}
	targToSound[6] = {1.332, 109}
	targToSound[7] = {1.254, 110}
	targToSound[8] = {1.358, 111}
	targToSound[9] = {1.280, 112}
	targToSound[10] = {1.254, 113}

	img = {}
	img['Sentinel']={"http://cloud-3.steamusercontent.com/ugc/1468688531114556676/3A8B5E111E50F5672C873B0513C63829CD166301/"}
	img['Doppelganger']={"http://cloud-3.steamusercontent.com/ugc/1290793971949202402/AE514129B43CD4B5CBE533D58E72FC96ECBACFAD/"}
	img['Werewolf']={"http://cloud-3.steamusercontent.com/ugc/1290793971949215940/85D25921F6A4544995628420A26574B641CC5016/"}
	img['Alpha Wolf']={"http://cloud-3.steamusercontent.com/ugc/1468688531114557816/5D2EDC70108D88545B5D8DC1228D696D9726A1A8/"}
	img['Mystic Wolf']={"http://cloud-3.steamusercontent.com/ugc/1468688531114559047/E897199EB0B8F89C50EB58224F8B15C4C4FF7527/"}
	img['Minion']={"http://cloud-3.steamusercontent.com/ugc/1290793971949212859/F37D6BF7CF686B82B701E7BC0F0402E4025EE740/"}
	img['Mason']={"http://cloud-3.steamusercontent.com/ugc/1290793971949214315/21A13BCC7E21F1FA73172A552CCA84EB0409CB0E/"}
	img['Seer']={"http://cloud-3.steamusercontent.com/ugc/1290793971949220339/37FCECB82226CDFF3347DE41A923EEB01CD56AB9/"}
	img['Apprentice Seer']={"http://cloud-3.steamusercontent.com/ugc/1468688531114560090/C0555E336C7800E100E180127608A6F668F26FBB/"}
	img['Paranormal Investigator']={"http://cloud-3.steamusercontent.com/ugc/1468688531114561028/2CFDEBB08D47BD8BCA91C464A5464A21B87C1E1C/"}
	img['Robber']={"http://cloud-3.steamusercontent.com/ugc/1290793971949218958/7D97D805A3784717C202D156F9BE110F6E6F343B/"}
	img['Witch']={"http://cloud-3.steamusercontent.com/ugc/1468688531114562343/59B269B8B479863210189C9CA2C7B7D7397A3FEF/"}
	img['Troublemaker']={"http://cloud-3.steamusercontent.com/ugc/1290793971949222270/AEC194BC6B7F27F2AF58C47297B2244A57B88589/"}
	img['Village Idiot']={"http://cloud-3.steamusercontent.com/ugc/1468688531114563329/0D24890AF154031B38D4D6531A1EF6723C781481/"}
	img['Aura Seer']={"http://cloud-3.steamusercontent.com/ugc/1468689039024715801/5E68A20D74B4FF106E8F0F89B9496BEC272B761C/"}
	img['Drunk']={"http://cloud-3.steamusercontent.com/ugc/1290793971949204112/7F12D5CC4406B3128B1BDA96F41F560CABBA263E/"}
	img['Insomniac']={"http://cloud-3.steamusercontent.com/ugc/1290793971949207933/97A87ABB99CA1338D0D659C225249F4897722B83/"}
	img['Revealer']={"http://cloud-3.steamusercontent.com/ugc/1468688531114564219/8DF15B4738E86DE705755A8810FC1DEFF857DBE1/"}
	img['Curator']={"http://cloud-3.steamusercontent.com/ugc/1468688531114565050/CF66A55848E117A6371BF75FFDC87F1061632600/"}
	img['Hunter']={"http://cloud-3.steamusercontent.com/ugc/1290793971949206408/9CA2D2B222A805A82D56AA9E3E5B7075E2804F63/"}
	img['Tanner']={"http://cloud-3.steamusercontent.com/ugc/1290793971949221527/9D4EF54B4F46DADE16CE6AC5339A1CD69AC6682C/"}
	img['Villager']={"http://cloud-3.steamusercontent.com/ugc/1290793971949210612/889F526349DBA48DD15757AA9568E835D84680DD/"}
	img['Dream Wolf']={"http://cloud-3.steamusercontent.com/ugc/1468688531114565922/D9515C345F32A8102968977867137C829E3AACDD/"}
	img['Bodyguard']={"http://cloud-3.steamusercontent.com/ugc/1468688531114566701/15EFDC0556FB74A51B55FABB32B39E8AEE6CB777/"}
	img['Cursed'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039024716840/973E87458E4EB1D3623E1605B8D31775670BD3F4/"}
	img['Prince'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039024713275/5B66855F74A6B35344D86D6C8F08F96DE7672F1B/"}
	img['Copycat'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028718864/7F21AC3868DFFEDA2F4B0D8EFCCA8CF7A9BC6442/"}
	img['Vampire'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028723311/1910A4EA6CD70F2DA1986AD22ADA582692408C70/"}
	img['The Master'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028722192/99DE33DEC265DF0DF3DB9EF5A67E1B394A3A387A/"}
	img['The Count'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028722760/7A6ADA686447D4105718646B4FC3A4322C6AC36C/"}
	img['Renfield'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028721774/9366C3765E987AC0BE33383F4DDF217208047815/"}
	img['Diseased'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028719590/AD471977A850E542778B92647308C2B0077EB13F/"}
	img['Cupid'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028719232/3D800642E16DCC44C0673C2664942EF941064920/"}
	img['Instigator'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028720164/112227241A347CE43B8F4EBBB36362A255DBD826/"}
	img['Priest'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028721425/420A051FBFD861CF04DF120D1B231D1BA192293D/"}
	img['Assassin'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028718637/C75D1305C9F1D8C11596526B7C8F489770F3DEFC/"}
	img['Apprentice Assassin'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028718024/A2D41BE44E40AA2466DBA868FE313FA67A0E22A2/"}
	img['Marksman'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028720433/0F122E42E1FD27A39D11C20FAA511B4CF10AEC15/"}
	img['Pickpocket'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028720948/35095BB526A0F1154E25413BB982EFABA4B914FA/"}
	img['Gremlin'] = {"http://cloud-3.steamusercontent.com/ugc/1468689039028719877/CE63C073D04346E58EA698F896AC358BB9913F39/"}
	img['Apprentice Tanner'] = {"http://cloud-3.steamusercontent.com/ugc/1472067480755703488/2CD11E42CCE0299F2F4396E18AB0B1ACB6F71681/"}
	img['Beholder'] = {"http://cloud-3.steamusercontent.com/ugc/1472067480755705077/2C5CAC9DC4FAD12C55D0EB6FAD103FB647A41995/"}
	img['Squire'] = {"http://cloud-3.steamusercontent.com/ugc/1472067480756054757/AA87DF5ED3E102D467B8E79A84DFD038243035B5/"}
	img['Thing'] = {"http://cloud-3.steamusercontent.com/ugc/1472067480755704398/A63355569E8A463C02C496CB22F07BB205C3BA5D/"}
  img['Mirror Man'] =	{'http://cloud-3.steamusercontent.com/ugc/1485578739873290593/CFB6D1495BF3DD16FB0B7E49AF68B8F07A16AC3A/'}
  img['Temptress'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873292933/635C7A8951D43CC4A1F116A95CBCAB8D8FBD2222/'}
  img['Dr. Peeker'] =	{'http://cloud-3.steamusercontent.com/ugc/1485578739873291066/DFDB004DD879F4948E06C3D730D1430471C38943/'}
  img['Rapscallion'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873291427/E1B14DB65426E8E5CD51DFEDCF527F14F80BAF22/'}
  img['Henchman #7'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873288596/B88C4AEB7F1F9C36562AF55A7626AC8581F023A8/'}
  img['Evilometer'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873287978/767AFB5BD375D93AD01EE6B95DF1A98E254C70A3/'}
  img['Mad Scientist'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873290230/D77F089DC53497C8EF76FBFA03BF24DA1E6E017B/'}
  img['Intern'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873289887/41AEE5C1F2ED31CCF9402B33ECE215B0B376968E/'}
  img['Annoying Lad'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873286950/D036892BFFAD5AEEC0E69FAC97FC8BF62376D75C/'}
  img['Detector'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873287185/6E43E3BA41718711729F32A00F90B3D34FC6CF7B/'}
  img['Role Retriever'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873291955/3205470B5891EA21B4AB1ED13060111177BBF670/'}
  img['Voodoo Lou'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873293309/B3F2EB73F9037499A294F63CF61D18C18FEE2FB9/'}
  img['Switcheroo'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873292593/4526A31765757A91174A423ECD591AA780DC73E1/'}
  img['Self-Awareness Girl'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873292296/3931DD78F5337BFB4B5FF209107D903E8E5321E6/'}
  img['Flipper'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873288273/5CF5C3C9E47E70BDE1D564E59A27792F95149ABE/'}
  img['Innocent Bystander'] = {'http://cloud-3.steamusercontent.com/ugc/1485578739873288955/6EC8DE3A9497B024CD462A774258D78DE33B8205/'}
  img['Family Man']={'http://cloud-3.steamusercontent.com/ugc/1488956992544551693/58DB2F8C2D457E8900AD2183BFA2C4EAE40DA884/'}
  img['Ricochet Rhino']={'http://cloud-3.steamusercontent.com/ugc/1488956992544554270/703E221C3FE2EB90FFE8770D68FB31DEAF18100C/'}
  img['Windy Wendy']={'http://cloud-3.steamusercontent.com/ugc/1488956992544556121/D3CF6A18451ADDAF098C186E41ECE90D2B0EF843/'}
  img['Defender-er']={'http://cloud-3.steamusercontent.com/ugc/1488956992544552269/440F1C2CDEA9E5C010E3F87315E357170238D69B/'}
  img['The Sponge']={'http://cloud-3.steamusercontent.com/ugc/1488956992544555224/93C00C3E7220B6B413E3E30C17E20A47D3604770/'}
  img['Oracle']={'http://cloud-3.steamusercontent.com/ugc/1488957142296487406/A10B22700E2511BF14139F1B2E5C7D8A61FE5DF6/'}
  img['Alien']={'http://cloud-3.steamusercontent.com/ugc/1488957142296480083/4B23414D97D6FD0AF22230B229EB668629B0B4B4/'}
  img['Synthetic Alien']={'http://cloud-3.steamusercontent.com/ugc/1488957142296489300/3E9C52214E1A942F6F0F91139D20FAD75249DB76/'}
  img['Cow']={'http://cloud-3.steamusercontent.com/ugc/1488957142296482836/1F30826FAAA824A58D7A59968DB522FD8BA004D7/'}
  img['Groob']={'http://cloud-3.steamusercontent.com/ugc/1488957142296485262/6DC668093950F4D4A3DFA04B63F9C9EFCA0D99CB/'}
  img['Zerb']={'http://cloud-3.steamusercontent.com/ugc/1488957142296490101/64B9A711FE3CD5E5A2F102F77753B33584A07471/'}
  img['Leader']={'http://cloud-3.steamusercontent.com/ugc/1488957142296486028/6D1ED16B5A61393AB6AF2A596AE275A15760993A/'}
  img['Psychic']={'http://cloud-3.steamusercontent.com/ugc/1488957142296487873/5158C68DDC692BABD641B7D46611A2A4D841F452/'}
  img['Rascal']={'http://cloud-3.steamusercontent.com/ugc/1488957142296488419/274DD5C515179520412829BD2619801DAD54F170/'}
  img['Exposer']={'http://cloud-3.steamusercontent.com/ugc/1488957142296484741/31F5CF2C9572FF898BFF207214DCE42EB2D9E1DA/'}
  img['Blob']={'http://cloud-3.steamusercontent.com/ugc/1488957142296480483/1834BB497A2480B097E6BD3455299247D9032003/'}
  img['Mortician']={'http://cloud-3.steamusercontent.com/ugc/1488957142296486428/98A21C702C1280F17641A5FC49EC0CE048652750/'}
  img['Body Snatcher']={'http://cloud-3.steamusercontent.com/ugc/1488957142296482317/4FFF075CC01CA9EA4329C978EE9A280FA2FA010E/'}
  img['Nostradamus']={'http://cloud-3.steamusercontent.com/ugc/1488957142296486930/619D553674185EBD51500B261A009D3CBED6113D/'}
  img['Empath']={'http://cloud-3.steamusercontent.com/ugc/1488957142296483553/8B1D09194699324E5B28D1FB8AE0DE3A1058AA4A/'}

  dopple_role_list = {} --these are the messages privately sent to Doppelganger
  dopple_role_list['Sentinel'] = {"You may place a shield token on another player's card."}
  dopple_role_list['Alpha Wolf'] = {"You must switch the center werewolf card with another player's card."}
  dopple_role_list['Mystic Wolf'] = {"You may look at another player's card."}
  dopple_role_list['Minion'] = {"You will be shown who the werewolves are, if there are any."}
  dopple_role_list['Seer'] = {"You may look at a player's card, OR two cards in the center."}
  dopple_role_list['Apprentice Seer'] = {"You may look at a card in the center."}
  dopple_role_list['Paranormal Investigator'] = {"You may look at up to two player's cards. If you see a werewolf or tanner, you must stop, and you become a werewolf or tanner."}
  dopple_role_list['Robber'] = {"You may switch your card with another player's card and look at your new card."}
  dopple_role_list['Witch'] = {"You may look at a card in the center, then switch it with another player's card."}
  dopple_role_list['Troublemaker'] = {"You may switch two other player's cards. But don't look at them."}
  dopple_role_list['Village Idiot'] = {"You may move everyone's cards, except your own, to the left or to the right."}
  dopple_role_list['Aura Seer'] = {"Wait until you are called again to do your action...","You will be shown what players have moved or looked at cards."}
  dopple_role_list['Drunk'] = {"You must switch you card with a card in the center. But don't look at it."}
  dopple_role_list['Insomniac'] = {"Wait until you are called again to do your action...","Look at your own card to see if it has changed."}
  dopple_role_list['Revealer'] = {"Wait until you are called again to do your action...","You may flip over any other player's card. If it is a werewolf or tanner, flip it back over."}
  dopple_role_list['Curator'] = {"Wait until you are called again to do your action...","You may place an artifact token on any player's card."}
  dopple_role_list['Copycat'] = {"You are now the role that the Copycat viewed, but you will not wake when that role is called."}
  dopple_role_list['Vampire'] = {"You are now a Vampire and will wake up with the other Vampires."}
  dopple_role_list['The Master'] = {"You are not a Vampire and will wake up with the other Vampires. If another vampire votes for you, you will not die. If you vote for the original Master, they will not die."}
  dopple_role_list['The Count'] = {"Wait until you are called again to do your action...","You MUST swap the Doppelganger Mark of Fear with any non-Vampire player's mark."}
  dopple_role_list['Renfield'] = {"Wait until you are called again to do your action...","You will be shown who the Vampires are and who they gave the Mark of the Vampire to. You must take the Doppleganger Mark of the Bat (this script does this for you)."}
  dopple_role_list['Diseased'] = {"You MUST swap the Doppleganger Mark of Diease with any adjacent player's mark."}
  dopple_role_list['Cupid'] = {"You MAY swap up to two Doppleganger Marks of Love with any player's marks."}
  dopple_role_list['Instigator'] = {"You MAY swap the Doppleganger Mark of the Traitor with any player's mark."}
  dopple_role_list['Priest'] = {"Wait until you are called again to do your action...","You MAY swap the Doppelganger Mark of Clarity with another player's mark."}
  dopple_role_list['Assassin'] = {"Wait until you are called again to do your action...","You MUST swap the Doppelganger Mark of the Assassin with any player's mark. After using the UI to place your mark, you will learn who the Apprentice Assassin is."}
  dopple_role_list['Apprentice Assassin'] = {"Wait until you are called again to do your action...","Wake up and look for the assassin."}
  dopple_role_list['Marksman'] = {"Wait until you are called again to do your action...","You MAY view one player's card and/or another player's mark (but not the same player if viewing both a Mark and a card)."}
  dopple_role_list['Pickpocket'] = {"Wait until you are called again to do your action...","You MAY exchange your Mark with the Mark of any other player, and then view your new Mark."}
  dopple_role_list['Gremlin'] = {"Wait until you are called again to do your action...","You MAY switch Marks or cards (but not both) between any two players (including yourself). But don't look at them."}
  dopple_role_list['Apprentice Tanner'] = {"Wait until you are called again to do your action...","Wake up and look for the Tanner, if there is no tanner. You assume the role of a Tanner."}
  dopple_role_list['Thing'] = {"You MAY bump the player on your right or the player on your left."}
  dopple_role_list['Squire'] = {"Wait until you are called again to do your action...","You will be shown which players started as Werewolves. You MAY view their cards to see if they have been switched."}
  dopple_role_list['Beholder'] = {"Wait until you are called again to do your action...","You will be shown which players started as the Seer and Apprentice Seer. You MAY view their cards to see if they have been switched."}
  dopple_role_list['Mirror Man'] = {"You are now the role that the Copycat viewed, but you will not wake when that role is called."}
  dopple_role_list['Temptress'] = {"Wait until you are called again to do your action...","Wake up and look for the Mad Scientist, if there is no tanner. You assume the role of a Mad Scientist."}
  dopple_role_list['Dr. Peeker'] = {"You MAY look at ONE other player's card."}
  dopple_role_list['Rapscallion'] = {"You MAY look at ONE center card."}
  dopple_role_list['Evilometer'] = {"When the Villains wake, you will be informed if one of your neighbors is a Villains."}
  dopple_role_list['Intern'] = {"Wait until you are called again to do your action...","Wake up and look for the Mad Scientist, if there is no tanner. You assume the role of a Mad Scientist."}
  dopple_role_list['Annoying Lad'] = {"You MAY repeatedly tap the player on your right or the player on your left."}
  dopple_role_list['Detector'] = {"You may look at a player's card, OR two cards in the center."}
  dopple_role_list['Role Retriever'] = {"You may switch your card with another player's card and look at your new card."}
  dopple_role_list['Voodoo Lou'] = {"You may look at a card in the center, then switch it with another player's card."}
  dopple_role_list['Switcheroo'] = {"You may switch two other player's cards. But don't look at them."}
  dopple_role_list['Self-Awareness Girl'] = {"Wait until you are called again to do your action...","Look at your own card to see if it has changed."}
  dopple_role_list['Flipper'] =  {"Wait until you are called again to do your action...","You may flip over any other player's card. If it is a werewolf or tanner, flip it back over."}
  dopple_role_list['Oracle'] = {"Wait for the Oracle to answer their question. If the Oracle's response changes the Oracle's team or win condition in anyway, the same applies to you."}
  dopple_role_list['Cow'] = {"When the Aliens wake, you will be informed if one of your neighbors is an Alien."}
  dopple_role_list['Groob'] = {"If another player if Zerb, they must die for you to win."}
  dopple_role_list['Zerb'] = {"If another player if Groob, they must die for you to win."}
  dopple_role_list['Leader'] = {"Wait until you are called again for further instruction...","Look for Aliens, if either Groob and Zerb are in play, you only win if both of them survive."}
  -----need to revisit these
  dopple_role_list['Psychic'] = {"Wait until you are called again for further instruction..."}
  dopple_role_list['Rascal'] = {"Wait until you are called again for further instruction..."}
  dopple_role_list['Exposer'] = {"Wait until you are called again for further instruction..."}
  dopple_role_list['Blob'] = {"You will not be called again, members of your blob are determined in the same fashion as the Blob."}
  dopple_role_list['Mortician'] = {"You win if one of your neighbors dies. Wait until you are called again for further instruction..."}
  dopple_role_list['Body Snatcher'] = {"Wait until you are called again for further instruction...",""}
  dopple_role_list['Empath'] = {"Wait until you are called again for further instruction...",""}
  dopple_role_list['Nostradamus'] = {"Wait until you are called again for further instruction...", "View up to 3 cards, if you see a card that is not on the Villager team, stop. You are now a member of that team."}

  init_dop_imm_action = {}
  init_dop_imm_action['start'] = {1.332,22}
  init_dop_imm_action['or'] = {0.522,37}
  init_dop_imm_action['action'] = {2.220,45}
  init_dop_imm_action['Diseased'] = {1.045,84}
  init_dop_imm_action['Cupid'] = {0.705,82}
  init_dop_imm_action['Instigator'] = {0.967,84}
  init_dop_imm_action['Sentinel'] = {0.810,41}
  init_dop_imm_action['Alpha Wolf'] = {0.993,34}
  init_dop_imm_action['Mystic Wolf'] = {0.940,36}
  init_dop_imm_action['Thing'] = {0.601,85}
  init_dop_imm_action['Seer'] = {0.705,40}
  init_dop_imm_action['Apprentice Seer'] = {1.332,33}
  init_dop_imm_action['Paranormal Investigator'] = {1.646,38}
  init_dop_imm_action['Robber'] = {0.731,39}
  init_dop_imm_action['Witch'] = {0.731,44}
  init_dop_imm_action['Village Idiot'] = {1.123,43}
  init_dop_imm_action['Drunk'] = {0.601,35}
  init_dop_imm_action['Troublemaker'] = {0.967,42}
 --init_dop_imm_action['Temptress'] = {X,Y}
 --init_dop_imm_action['Annoying Lad'] = {X,Y}
 --init_dop_imm_action['Detector'] = {X,Y}
 --init_dop_imm_action['Role Retriever'] = {X,Y}
 --init_dop_imm_action['Switcheroo'] = {X,Y}
 --init_dop_imm_action['Voodoo Lou'] = {X,Y}

  init_addition_villain_time = {}
  init_addition_villain_time['Temptress'] = {10.501, 35}
  init_addition_villain_time['Dr. Peeker'] = {6.374, 21}
  init_addition_villain_time['Rapscallion'] = {8.229, 28}

  no_night_list = {
    {'Villager'},{'Tanner'},{'Hunter'},{'Bodyguard'},{'Dream Wolf'},{'Prince'},{'Cursed'},{'The Master'},{'Innocent Bystander'},{'Evilometer'},{'Mad Scientist'},{'Ricochet Rhino'}, {'The Sponge'}, {'Defender-er'}, {'Windy Wendy'},{'Cow'}
  }

  --[[list of roles in a game]]
  play_list = {}
  --[[list of player's starting roles]]
  player_list = {}

  card_states = {}

  color_list = {'White','Pink','Purple','Blue','Teal','Green','Yellow','Orange','Red','Brown'}

  playerc_list = {}

  g_table = {}
  g_table['1af2c7'] = {'Doppelganger','655317'}
  g_table['aee9b8'] = {'Werewolf','d913bc'}
  g_table['234c49'] = {'Werewolf','b87151'}
  g_table['e8cc45'] = {'Minion','b4cbe2'}
  g_table['9894aa'] = {'Mason','9148de'}
  g_table['d61a8e'] = {'Mason','793ea0'}
  g_table['c5d18c'] = {'Seer','3a9b7d'}
  g_table['cdc0ac'] = {'Robber','222846'}
  g_table['cbfc31'] = {'Troublemaker','9b497c'}
  g_table['b8fcfc'] = {'Drunk','70e466'}
  g_table['2591d2'] = {'Insomniac','25e57d'}
  g_table['2ca7e0'] = {'Hunter','2b87f5'}
  g_table['2b784e'] = {'Tanner','46d8c8'}
  g_table['6d5a44'] = {'Villager','a033f9'}
  g_table['f59eef'] = {'Villager','119bae'}
  g_table['2e42fe'] = {'Villager','d07d71'}
  g_table['fe3f87'] = {'Sentinel','fb2f02'}
  g_table['5be75c'] = {'Alpha Wolf','767847'}
  g_table['d25942'] = {'Mystic Wolf','58ab73'}
  g_table['1f1560'] = {'Apprentice Seer','8f8e31'}
  g_table['011064'] = {'Paranormal Investigator','600832'}
  g_table['ad6187'] = {'Witch','5785e5'}
  g_table['a44dd5'] = {'Village Idiot','f63fe7'}
  g_table['67c973'] = {'Revealer','b32272'}
  g_table['c71123'] = {'Curator','785a24'}
  g_table['b64b31'] = {'Dream Wolf','dec240'}
  g_table['a58873'] = {'Bodyguard','9414ce'}
  g_table['673e45'] = {'Werewolf','cf4331'}
  g_table['d9153f'] = {'Aura Seer','5ba64e'}
  g_table['c58854'] = {'Prince','34356e'}
  g_table['a3887d'] = {'Cursed','425e7a'}
  g_table['2b50e0'] = {'Copycat','927095'}
  g_table['0779a6'] = {'Vampire','b2e6aa'}
  g_table['a1a7d9'] = {'The Master','2200f4'}
  g_table['1d1745'] = {'The Count','49d43b'}
  g_table['e3c4ef'] = {'Renfield','fc6888'}
  g_table['cbfb44'] = {'Diseased','1d17bf'}
  g_table['12884a'] = {'Cupid','c458a9'}
  g_table['cdfefd'] = {'Instigator','cdd313'}
  g_table['c64419'] = {'Priest','2b685f'}
  g_table['aea428'] = {'Assassin','7e6fd3'}
  g_table['3011c0'] = {'Apprentice Assassin','fbd673'}
  g_table['4c73c7'] = {'Marksman','c67ea6'}
  g_table['59c220'] = {'Pickpocket','0b65c8'}
  g_table['3735a0'] = {'Gremlin','f7f04b'}
  g_table['4ca933'] = {'Apprentice Tanner','a653e9'}
  g_table['39974c'] = {'Beholder','21d3a4'}
  g_table['f92b02'] = {'Thing','20e0ba'}
  g_table['63f05c'] = {'Squire','daa3c4'}
  g_table['d04aad'] = {'Mirror Man', 'c06d5f'}
  g_table['8e9c4c'] = {'Temptress', '4323ee'}
  g_table['4dee31'] = {'Dr. Peeker', 'f5a41d'}
  g_table['e61a25'] = {'Rapscallion', '7bc922'}
  g_table['a7e91e'] = {'Henchman #7', '45e84b'}
  g_table['4068f2'] = {'Evilometer', '46af68'}
  g_table['bffab1'] = {'Mad Scientist', '81c6ca'}
  g_table['b3cab1'] = {'Intern', '70f212'}
  g_table['41c2a6'] = {'Annoying Lad', '8d72aa'}
  g_table['8f3ff9'] = {'Detector', 'c4559f'}
  g_table['b08baa'] = {'Role Retriever', '2b9d81'}
  g_table['7722f9'] = {'Voodoo Lou', 'b11f70'}
  g_table['b4618c'] = {'Switcheroo', '3f61ad'}
  g_table['fca083'] = {'Self-Awareness Girl', '609a80'}
  g_table['898737'] = {'Flipper', '5f67ff'}
  g_table['68c7cc'] = {'Family Man', '3c6742'}
  g_table['ede031'] = {'Ricochet Rhino', '2ebdeb'}
  g_table['feddf9'] = {'Windy Wendy', 'c58d17'}
  g_table['c6d172'] = {'Defender-er', '036851'}
  g_table['c5fb55'] = {'The Sponge', 'ecfc37'}
  g_table['5eb19f'] = {'Innocent Bystander', '1069a8'}
  g_table['8235c0'] = {'Innocent Bystander','245e3d'}

  g_table['30b4d0'] = {'Oracle', '1321c8'}
  g_table['bb5294'] = {'Alien', '47c38a'}
  g_table['18fb11'] = {'Alien', 'be509e'}
  g_table['c66701'] = {'Synthetic Alien', '841147'}
  g_table['d34d4c'] = {'Cow', 'e1dc18'}
  g_table['b30458'] = {'Groob', 'bffc39'}
  g_table['f736c4'] = {'Zerb', 'a8d5a1'}
  g_table['5228d3'] = {'Leader', '0a4810'}
  g_table['5fdc07'] = {'Psychic', '13c21b'}
  g_table['ed6e7d'] = {'Rascal', '6975e2'}
  g_table['0cf929'] = {'Exposer', 'cf0edb'}
  g_table['93a091'] = {'Blob', 'a8dae8'}
  g_table['2bb3b5'] = {'Mortician', '5111da'}
  g_table['afbbda'] = {'Body Snatcher', '660ffc'}
  g_table['691829'] = {'Nostradamus', '719db4'}
  g_table['0d4a86'] = {'Empath', '394024'}

  areas = {}
  areas.white_S = {'8a680a','White','fd9417','White Token'}
  areas.pink_S = {'64f12f','Pink','d00b88','Pink Token'}
  areas.purple_S = {'5a42e7','Purple','24c21d','Purple Token'}
  areas.blue_S = {'a8cf37','Blue','f5741b','Blue Token'}
  areas.teal_S = {'62ae88','Teal','a965e8','Teal Token'}
  areas.green_S = {'47ed60','Green','4cb519','Green Token'}
  areas.yellow_S = {'acd8bd','Yellow','d96afd','Yellow Token'}
  areas.orange_S = {'b9d363','Orange','05a44e','Orange Token'}
  areas.red_S = {'3995fc','Red','0fe72c','Red Token'}
  areas.brown_S = {'ce2ce1','Brown','c3a36a','Brown Token'}
  areas.center_left_S = {'ca977a','Center left','ca977a'}
  areas.center_S = {'69f020','Center top','69f020'}
  areas.center_right_S = {'5f231b','Center right','5f231b'}
  areas.center_bottom_S = {'0e6bf5','Center bottom','0e6bf5'}

  allthings = getObjectFromGUID('b12cf7')
  allthingsinplayarea = getObjectFromGUID('3020fc')
 --allthethings = allthings.getObjects()

  initialLocation = {}
  initialLocation['Sentinel'] =					{'fe3f87',{12.20,0.915,52.52},'fb2f02',{12.20,1.09,52.52},{-6.0,1.13,6.0}, '8dfb26', {4.5,0.93,44},{-4.8,0.99,-4.11}, '2ace33', {4.5,0.93,42.60},{-3.45,0.99,-4.11}}
  initialLocation['Alpha Wolf'] =				{'5be75c',{14.75,0.915,52.52},'767847',{14.75,1.09,52.52},{0.0,1.13,6.0}, '673e45', {19.85,0.915,45.72},{0,0.97,-4.28},'cf4331',{19.85,1.09,45.72},{0,1.13,-8.00}}
  initialLocation['Mystic Wolf'] =				{'d25942',{17.30,0.915,52.52},'58ab73',{17.30,1.09,52.52},{1.5,1.13,6.0}}
  initialLocation['Apprentice Seer'] =			{'1f1560',{19.85,0.915,52.52},'8f8e31',{19.85,1.09,52.52},{-4.5,1.13,4.5}}
  initialLocation['Paranormal Investigator'] =	{'011064',{12.20,0.915,49.12},'600832',{12.20,1.09,49.12},{-3.0,1.13,4.5}}
  initialLocation['Witch'] =					{'ad6187',{14.75,0.915,49.12},'5785e5',{14.75,1.09,49.12},{0,1.13,4.5}}
  initialLocation['Village Idiot'] =			{'a44dd5',{17.30,0.915,49.12},'f63fe7',{17.30,1.09,49.12},{3.0,1.13,4.5}}
  initialLocation['Revealer'] =					{'67c973',{19.85,0.915,49.12},'b32272',{19.85,1.09,49.12},{-4.5,1.13,3.0}}
  initialLocation['Curator'] =					{'c71123',{12.20,0.915,45.72},'785a24',{12.20,1.09,45.72},{4.5,1.13,3.0}, 'f008df', {9.00,1.23,43.00},{-6.5,1.09,0}}
  initialLocation['Dream Wolf'] =				{'b64b31',{14.75,0.915,45.72},'dec240',{14.75,1.09,45.72},{6.0,1.13,3.0}}
  initialLocation['Bodyguard'] =				{'a58873',{17.30,0.915,45.72},'9414ce',{17.30,1.09,45.72},{6.0,1.13,3.0}}

  initialLocation['Doppelganger1'] =			{'1af2c7',{40.025,0.915,52.52},'655317',{40.025,1.09,52.52},{-4.5,1.13,6.0}}
  initialLocation['Werewolf2'] = 				{'234c49',{42.575,0.915,52.52},'b87151',{42.575,1.09,52.52},{-3.0,1.13,6.0}}
  initialLocation['Werewolf3'] = 				{'aee9b8',{45.125,0.915,52.52},'d913bc',{45.125,1.09,52.52}, {-1.5,1.13,6.0}}
  initialLocation['Minion4'] = 					{'e8cc45',{47.675,0.915,52.52},'b4cbe2',{47.675,1.09,52.52}, {3.0,1.13,6.0}}
  initialLocation['Mason5'] = 					{'d61a8e',{40.025,0.915,49.12},'793ea0',{40.025,1.09,49.12},{4.5,1.13,6.0}}
  initialLocation['Mason6'] = 					{'9894aa',{42.575,0.915,49.12},'9148de',{42.575,1.09,49.12},{6.0,1.13,6.0}}
  initialLocation['Seer7'] = 					{'c5d18c',{45.125,0.915,49.12},'3a9b7d',{45.125,1.09,49.12}, {-6.0,1.13,4.5}}
  initialLocation['Robber8'] = 					{'cdc0ac',{47.675,0.915,49.12},'222846',{47.675,1.09,49.12}, {-1.5,1.13,4.5}}
  initialLocation['Troublemaker9']=				{'cbfc31',{40.025,0.915,45.72},'9b497c',{40.025,1.09,45.72},{1.5,1.13,4.5}}
  initialLocation['Drunk10'] = 					{'b8fcfc',{42.575,0.915,45.72},'70e466',{42.575,1.09,45.72},{4.5,1.13,4.5}}
  initialLocation['Insomniac11'] = 				{'2591d2',{45.125,0.915,45.72},'25e57d',{45.125,1.09,45.72}, {6.0,1.13,4.5}}
  initialLocation['Hunter12'] = 				{'2ca7e0',{47.675,0.915,45.72},'2b87f5',{47.675,1.09,45.72}, {-3.0,1.13,3.0}}
  initialLocation['Tanner13'] = 				{'2b784e',{40.025,0.915,42.42},'46d8c8',{40.025,1.09,42.42},{-1.5,1.13,3.0}}
  initialLocation['Villager14'] = 				{'f59eef',{42.575,0.915,42.42},'119bae',{42.575,1.09,42.42},{0,1.13,3.0}}
  initialLocation['Villager15'] = 				{'2e42fe',{45.125,0.915,42.42},'d07d71',{45.125,1.09,42.42}, {1.5,1.13,3.0}}
  initialLocation['Villager16'] = 				{'6d5a44',{47.675,0.915,42.42},'a033f9',{47.675,1.09,42.42}, {3.0,1.13,3.0}}

  initialLocation['Copycat'] = 				{'2b50e0',{-15.9,0.915,52.52},'927095',{-15.9,1.09,52.52}, {0,10,3.0}}
  initialLocation['Vampire'] = 				{'0779a6',{-13.35,0.915,52.52},'b2e6aa',{-13.35,1.09,52.52}, {3.0,10,3.0}}
  initialLocation['The Master'] = 			{'a1a7d9',{-10.80,0.915,52.52},'2200f4',{-10.80,1.09,52.52}, {3.0,10,3.0}}
  initialLocation['The Count'] = 			{'1d1745',{-8.25,0.915,52.52},'49d43b',{-8.25,1.09,52.52}, {3.0,10,3.0}}
  initialLocation['Renfield'] = 			{'e3c4ef',{-5.9,0.915,52.52},'fc6888',{-5.9,1.09,52.52}, {3.0,10,3.0}}
  initialLocation['Diseased'] = 			{'cbfb44',{-15.9,0.915,49.12},'1d17bf',{-15.9,1.09,49.12}, {3.0,10,3.0}}
  initialLocation['Cupid'] = 				{'12884a',{-13.35,0.915,49.12},'c458a9',{-13.35,1.09,49.12}, {3.0,10,3.0}}
  initialLocation['Instigator'] = 			{'cdfefd',{-10.80,0.915,49.12},'cdd313',{-10.80,1.09,49.12}, {3.0,10,3.0}}
  initialLocation['Priest'] = 				{'c64419',{-8.25,0.915,49.12},'2b685f',{-8.25,1.09,49.12}, {3.0,10,3.0}}
  initialLocation['Assassin'] = 			{'aea428',{-5.9,0.915,49.12},'7e6fd3',{-5.9,1.09,49.12}, {3.0,10,3.0}}
  initialLocation['Apprentice Assassin'] = 	{'3011c0',{-15.9,0.915,45.72},'fbd673',{-15.9,1.09,45.72}, {3.0,10,3.0}}
  initialLocation['Marksman'] = 			{'4c73c7',{-13.35,0.915,45.72},'c67ea6',{-13.35,1.09,45.72}, {3.0,10,3.0}}
  initialLocation['Pickpocket'] = 			{'59c220',{-10.80,0.915,45.72},'0b65c8',{-10.80,1.09,45.72}, {3.0,10,3.0}}
  initialLocation['Gremlin'] = 				{'3735a0',{-8.25,0.915,45.72},'f7f04b',{-8.25,1.09,45.72}, {3.0,10,3.0}}

  initialLocation['Body Snatcher'] =		{'afbbda', {-37.90, 0.93, 52.52},'660ffc', {-37.90, 1.09, 52.52},{-6.0,1.13,-3.0}}
  initialLocation['Apprentice Tanner'] =	{'4ca933', {-35.31, 0.93, 52.52},'a653e9', {-35.31, 1.09, 52.52},{-6.0,1.13,-3.0}}
  initialLocation['Thing'] =				{'f92b02', {-32.72, 0.93, 52.52},'20e0ba', {-32.72, 1.09, 52.52},{-6.0,1.13,-3.0}}
  initialLocation['Nostradamus'] =			{'691829', {-30.13, 0.93, 52.52},'719db4', {-30.13, 1.09, 52.52},{-6.0,1.13,-3.0}}
  initialLocation['Aura Seer'] =			{'d9153f', {-37.90, 0.93, 49.12},'5ba64e', {-37.90, 1.09, 49.12},{-6.0,1.13,-3.0}}
  initialLocation['Squire'] =				{'63f05c', {-35.31, 0.93, 49.12}, 'daa3c4', {-35.31, 1.09, 49.12},  {-6.0,1.13,-3.0}}
  initialLocation['Family Man'] =			{'68c7cc', {-32.72, 0.93, 49.12},'3c6742', {-32.72, 1.09, 49.12},{-6.0,1.13,-3.0}}
  initialLocation['Beholder'] =				{'39974c', {-30.13, 0.93, 49.12},'21d3a4', {-30.13, 1.09, 49.12},{-6.0,1.13,-3.0}}
  initialLocation['Empath'] =				{'0d4a86', {-37.90, 0.93, 45.72},'394024', {-37.90, 1.09, 45.72},{-6.0,1.13,-3.0}}
  initialLocation['Prince'] =				{'c58854', {-35.31, 0.93, 45.72},'34356e', {-35.31, 1.09, 45.72},{6.0,1.13,-3.0}}
  initialLocation['Cursed'] =				{'a3887d', {-32.72, 0.93, 45.72},'425e7a', {-32.72, 1.09, 45.72},{4.5,1.13,-3.0}}
  initialLocation['The Sponge'] =			{'c5fb55', {-30.13, 0.93, 45.72},'ecfc37', {-30.13, 1.09, 45.72},{-6.0,1.13,-3.0}}
  initialLocation['Ricochet Rhino'] =		{'ede031', {-37.90, 0.93, 42.32},'2ebdeb', {-37.90, 1.09, 42.32},{-6.0,1.13,-3.0}}
  initialLocation['Defender-er'] =			{'c6d172', {-35.31, 0.93, 42.32},'036851', {-35.31, 1.09, 42.32},{-6.0,1.13,-3.0}}
  initialLocation['Windy Wendy'] =			{'feddf9', {-32.72, 0.93, 42.32},'c58d17', {-32.72, 1.09, 42.32},{-6.0,1.13,-3.0}}
  initialLocation['Innocent Bystander2'] =	{'5eb19f', {-30.13, 0.93, 42.32},'1069a8', {-30.13, 1.09, 42.32},{-6.0,1.13,-3.0}}

  initialLocation['Mirror Man'] =	      {'d04aad',{-15.90, 0.93, 71.02},'c06d5f',{-15.90, 1.11, 71.02},{-6.0,1.13,-3.0}}
  initialLocation['Temptress'] =				{'8e9c4c',{-13.35, 0.93, 71.02},'4323ee',{-13.35, 1.11, 71.02},{-6.0,1.13,-3.0},'a7e91e', {-15.90, 0.93, 67.62},{0,0.97,-4.28},'45e84b',{-15.90, 1.11, 67.62},{0,1.13,-8.00}}
  initialLocation['Dr. Peeker'] =			  {'4dee31',{-10.80, 0.93, 71.02},'f5a41d',{-10.80, 1.11, 71.02},{-6.0,1.13,-3.0}}
  initialLocation['Rapscallion'] =				{'e61a25',{-8.25, 0.93, 71.02}, '7bc922', {-8.25, 1.11, 71.02},  {-6.0,1.13,-3.0}}
  initialLocation['Henchman #7'] =				{'a7e91e',{-15.90, 0.93, 67.62},'45e84b',{-15.90, 1.11, 67.62},{-6.0,1.13,-3.0}}
  initialLocation['Evilometer'] =				{'4068f2',{-13.35, 0.93, 67.62},'46af68',{-13.35, 1.11, 67.62},{4.5,1.13,-3.0}}
  initialLocation['Mad Scientist'] =				{'bffab1',{-10.80, 0.93, 67.62},'81c6ca',{-10.80, 1.11, 67.62},{6.0,1.13,-3.0}}
  initialLocation['Intern'] =	      {'b3cab1',{-8.25, 0.93, 67.62},'70f212',{-8.25, 1.11, 67.62},{-6.0,1.13,-3.0}}
  initialLocation['Annoying Lad'] =				{'41c2a6',{-15.92, 0.93, 64.22},'8d72aa',{-15.92,1.11, 64.22},{-6.0,1.13,-3.0}}
  initialLocation['Detector'] =			  {'8f3ff9',{-13.35, 0.93, 64.22},'c4559f',{-13.35, 1.11, 64.22},{-6.0,1.13,-3.0}}
  initialLocation['Role Retriever'] =				{'b08baa',{-10.80, 0.93, 64.22}, '2b9d81', {-10.80, 1.11, 64.22},  {-6.0,1.13,-3.0}}
  initialLocation['Voodoo Lou'] =				{'7722f9',{-8.25, 0.93, 64.22},'b11f70',{-8.25, 1.11, 64.22},{-6.0,1.13,-3.0}}
  initialLocation['Switcheroo'] =				{'b4618c',{-15.92, 0.93, 60.82},'3f61ad',{-15.92, 1.11, 60.82},{4.5,1.13,-3.0}}
  initialLocation['Self-Awareness Girl'] =				{'fca083',{-13.35, 0.93, 60.82},'609a80',{-13.35, 1.11, 60.82},{6.0,1.13,-3.0}}
  initialLocation['Flipper'] =	             {'898737',{-10.80, 0.93, 60.82},'5f67ff',{-10.80, 1.11, 60.82},{-6.0,1.13,-3.0}}
  initialLocation['Innocent Bystander'] =		 {'8235c0',{-8.25, 0.93, 60.82},'245e3d',{-8.25, 1.11, 60.82},{-6.0,1.13,-3.0}}

  initialLocation['Oracle'] =		 {'30b4d0', {12.20, 0.93, 71.02} ,'1321c8', {12.20, 0.93, 71.02} }
  initialLocation['Alienz1'] =		 {'bb5294', {14.75, 0.93, 71.02} ,'47c38a', {14.75, 0.93, 71.02} }
  initialLocation['Alienz2'] =		 {'18fb11', {17.30, 0.93, 71.02} ,'be509e', {17.30, 0.93, 71.02}  }
  initialLocation['Synthetic Alien'] =		 {'c66701', {19.85, 0.93, 71.02} ,'841147', {19.85, 0.93, 71.02} }
  initialLocation['Cow'] =		 {'d34d4c', {12.20, 0.93, 67.62} ,'e1dc18', {12.20, 0.93, 67.62} }
  initialLocation['Groob'] =		 {'b30458', {14.75, 0.93, 67.62} ,'bffc39', {14.75, 0.93, 67.62} }
  initialLocation['Zerb'] =		 {'f736c4', {17.30, 0.93, 67.62} ,'a8d5a1', {17.30, 0.93, 67.62} }
  initialLocation['Leader'] =		{'5228d3', {19.85, 0.93, 67.62} ,'0a4810', {19.85, 0.93, 67.62} }
  initialLocation['Psychic'] =		{'5fdc07', {12.20, 0.93, 64.22} ,'13c21b', {12.20, 0.93, 64.22} }
  initialLocation['Rascal'] =		 {'ed6e7d', {14.75, 0.93, 64.22} ,'6975e2', {14.75, 0.93, 64.22} }
  initialLocation['Exposer'] =		 {'0cf929', {17.30, 0.93, 64.22} ,'cf0edb', {17.30, 0.93, 64.22} }
  initialLocation['Blob'] =		 {'93a091', {19.85, 0.93, 64.22} ,'a8dae8', {19.85, 0.93, 64.22} }
  initialLocation['Mortician'] =		{'2bb3b5', {12.20, 0.93, 60.82} ,'5111da', {12.20, 0.93, 60.82} }

  mb_initialLocation = {}
  mb_initialLocation['Markboard'] =				{'c5bb80',{0,0.96,4.55},{-16.61, 0.92, 41.34}}
  mb_initialLocation['Markboard01'] = 			{'674c02',{-6.37,1.07,5.63},{-22.98,1.03,42.42}}
  mb_initialLocation['Markboard02'] =			{'8fc618',{-4.95,1.07,5.63},{-21.56,1.03,42.42}}
  mb_initialLocation['Markboard03'] = 			{'0b33f9',{-4.95,1.07,3.48},{-21.56,1.03,40.26}}
  mb_initialLocation['Markboard04'] = 			{'2c0240',{-3.53,1.07,5.63},{-20.14,1.03,42.42}}
  mb_initialLocation['Markboard05'] = 			{'d67919',{-3.53,1.07,3.48},{-20.14,1.03,40.26}}
  mb_initialLocation['Markboard06'] = 			{'650332',{-2.11,1.07,5.63},{-18.72,1.03,42.42}}
  mb_initialLocation['Markboard07'] = 			{'b8af13',{-2.11,1.07,3.48},{-18.72,1.03,40.26}}
  mb_initialLocation['Markboard08'] = 			{'305c28',{-0.69,1.07,5.63},{-17.3,1.03,42.42}}
  mb_initialLocation['Markboard09'] = 			{'6bcd9d',{-0.69,1.07,3.48},{-17.3,1.03,40.26}}
  mb_initialLocation['Markboard10'] = 			{'ae80db',{0.73,1.07,5.63},{-15.88,1.03,42.42}}
  mb_initialLocation['Markboard11'] = 			{'f4902d',{0.73,1.07,3.48},{-15.88,1.03,40.26}}
  mb_initialLocation['Markboard12'] = 			{'d3901c',{2.15,1.07,5.63},{-14.46,1.03,42.42}}
  mb_initialLocation['Markboard13'] = 			{'445459',{2.15,1.07,3.48},{-14.46,1.03,40.26}}
  mb_initialLocation['Markboard14'] = 			{'9e2490',{3.57,1.07,5.63},{-13.04,1.03,42.42}}
  mb_initialLocation['Markboard15'] = 			{'1a7d3c',{3.57,1.07,3.48},{-13.04,1.03,40.26}}
  mb_initialLocation['Markboard16'] = 			{'f026f9',{4.98,1.07,5.63},{-11.63,1.03,42.42}}
  mb_initialLocation['Markboard17'] = 			{'9b9f43',{4.98,1.07,3.48},{-11.63,1.03,40.26}}
  mb_initialLocation['Markboard18'] = 			{'ba102b',{6.41,1.07,5.63},{-10.2,1.03,42.42}}
  mb_initialLocation['Markboard19'] = 			{'19793d',{6.41,1.07,3.48},{-10.2,1.03,40.26}}

  token_list = {}
  token_list['8dfb26'] = 'You have the shield. Your card cannot be looked at or moved.'
  token_list['2ace33'] = 'You have the shield. Your card cannot be looked at or moved.'
  token_list['d7bbed'] = "You received the Mask of Muting: You may not talk to other players, either with voice or text for the rest of the game."
  token_list['bb0322'] = "You received the Cudgel of the Tanner: You are now a Tanner, and only win if you get killed."
  token_list['d27947'] = "You received the Brand of the Villager: You are now a Villager, with no special abilities."
  token_list['d2a545'] = "You received the Void of Nothingness: This artifact has no effect."
  token_list['d3c16a'] = "You received the Claw of the Werewolf: You are now a werewolf."
  token_list['8a3677'] = "You received the Cloak of the Prince: You are now a Prince. Votes against you do not count."
  token_list['36c368'] = "You received the Bow of the Hunter: You are now a Hunter. If you die, the player you vote for also dies."
  token_list['43052f'] = "You received the Sword of the Bodyguard: You are now a Bodyguard. The player you vote for cannot be killed."
  token_list['841aa1'] = "You received the Dagger of the Traitor: You are a Traitor to your team. You only win if someone else on your team dies."
  token_list['4cfdbe'] = "You received the Mist of the Vampire: You are now a Vampire, and win or lose with the Vampire team."
  token_list['f6ccae'] = "You received the Alien Artifact: You are now an Alien, and win or lose with the Alien team."
  token_list['b6ba43'] = "You received the Shroud of Shame: You will be blindfolded and must remain blindfolded until the voting phase is over."

	markboard = {}
	markboard[1] 	= {'2e940a','674c02'}
	markboard[2] 	= {'02f0a5','8fc618'}
	markboard[3] 	= {'adf937','0b33f9'}
	markboard[4] 	= {'ed42c6','2c0240'}
	markboard[5] 	= {'fa4556','d67919'}
	markboard[6]	= {'2632eb','650332'}
	markboard[7] 	= {'cfd4a8','b8af13'}
	markboard[8] 	= {'6a0b44','305c28'}
	markboard[9] 	= {'33b020','6bcd9d'}
	markboard[10] 	= {'92f3aa','ae80db'}
	markboard[11] 	= {'cde7d8','f4902d'}
	markboard[12] 	= {'ab0e75','d3901c'}
	markboard[13] 	= {'d25365','445459'}
	markboard[14] 	= {'b30957','9e2490'}
	markboard[15] 	= {'5fd1ec','1a7d3c'}
	markboard[16]	= {'97d4de','f026f9'}
	markboard[17] 	= {'ee6c4a','9b9f43'}
	markboard[18] 	= {'48e3a0','ba102b'}
	markboard[19]	= {'12af83','19793d'}
	markboard['White']	= {'203d60','1abbe4',{-6.41, 0.93, 46.54}}
	markboard['Pink']	= {'121f30','93576e',{-5.15, 0.93, 46.54}}
	markboard['Purple']	= {'14a4bb','62f28e',{-6.41, 0.93, 45.25}}
	markboard['Blue']	= {'a07db0','9f97da',{-5.15, 0.93, 45.25}}
	markboard['Teal']	= {'3ac487','2bb0d3',{-6.41, 0.93, 43.96}}
	markboard['Green']	= {'c7c2ba','d6638e',{-5.15, 0.93, 43.96}}
	markboard['Yellow']	= {'e8f0fb','88b50a',{-6.41, 0.93, 42.67}}
	markboard['Orange']	= {'67ca28','360111',{-5.15, 0.93, 42.67}}
	markboard['Red']	= {'24e89c','ea4d21',{-6.41, 0.93, 41.38}}
	markboard['Brown']	= {'7eaea2','f8445e',{-5.15, 0.93, 41.38}}

	marks_list ={}
	marks_list['674c02'] = 'You have the Mark of the Vampire. You are now a Vampire, but can still use your night or vote action.'
	marks_list['8fc618'] = 'You have the Mark of Fear. You may not do your night action, if any.'
	marks_list['0b33f9'] = 'You have the Mark of Fear. You may not do your night action, if any.'
	marks_list['2c0240'] = 'You have the Mark of the Bat. This mark has no effect.'
	marks_list['d67919'] = 'You have the Mark of the Bat. This mark has no effect.'
	marks_list['650332'] = 'You have the Mark of Disease. Any player who votes for the player with the Mark of Disease cannot win.'
	marks_list['b8af13'] = 'You have the Mark of Disease. Any player who votes for the player with the Mark of Disease cannot win.'
	marks_list['305c28'] = 'You have the Mark of Love. Immediately after Dusk you will see who you are in love with. If a player with the Mark of Love dies, any other players with the Mark of Love also die.'
	marks_list['6bcd9d'] = 'You have the Mark of Love. Immediately after Dusk you will see who you are in love with. If a player with the Mark of Love dies, any other players with the Mark of Love also die.'
	marks_list['ae80db'] = 'You have the Mark of Love. Immediately after Dusk you will see who you are in love with. If a player with the Mark of Love dies, any other players with the Mark of Love also die.'
	marks_list['f4902d'] = 'You have the Mark of Love. Immediately after Dusk you will see who you are in love with. If a player with the Mark of Love dies, any other players with the Mark of Love also die.'
	marks_list['d3901c'] = 'You have the Mark of the Traitor. You only win if a player on your team dies. If you are the only player on your team, this has no effect.'
	marks_list['445459'] = 'You have the Mark of the Traitor. You only win if a player on your team dies. If you are the only player on your team, this has no effect.'
	marks_list['9e2490'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['1a7d3c'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['f026f9'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['9b9f43'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['ba102b'] = 'You have the Mark of the Assassin. The Assassin (or Apprentice Assassin if there is no Assassin) only wins if you are killed.'
	marks_list['19793d'] = 'You have the Mark of the Assassin. The Assassin (or Apprentice Assassin if there is no Assassin) only wins if you are killed.'
	marks_list['1abbe4'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['93576e'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['62f28e'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['9f97da'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['2bb0d3'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['d6638e'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['88b50a'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['360111'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['ea4d21'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'
	marks_list['f8445e'] = 'You have the Mark of Clarity. Your role, team, and win condition are determined by your card.'

  noise_cards = {}
  noise_cards[1] = getObjectFromGUID('e8167d')
  noise_cards[2] = getObjectFromGUID('989df2')
  noise_cards[3] = getObjectFromGUID('113103')
  noise_cards[4] = getObjectFromGUID('13c0e0')
  noise_cards[5] = getObjectFromGUID('e31e7a')
  noise_cards[6] = getObjectFromGUID('4dcdcb')
  noise_cards[7] = getObjectFromGUID('e34da6')
  noise_cards[8] = getObjectFromGUID('256ea9')
  noise_cards[9] = getObjectFromGUID('23cf02')
  noise_cards[10] = getObjectFromGUID('304a03')

  for i,g in pairs(noise_cards)do
	g.interactable = false
  end

  lockAllObjects = allthings.getObjects()
  unlockAllObjectsonTable = allthingsinplayarea.getObjects()
  for o,c in ipairs(lockAllObjects) do
  	c.setLock(true)
  end

  for o,c in ipairs(unlockAllObjectsonTable) do
  	c.setLock(false)
  end
end

--[[This function updates the card_states array, ~0 means the card is faceup, ~180 means the card is facedown]]
function checkFlip()
  card_states = {}
  for i,v in pairs(areas) do
    zone = getObjectFromGUID(v[1])
    cards = zone.getObjects()
    for o,c in ipairs(cards) do
      g = c.guid
      if g_table[g] ~= nil then
        rot = c.getRotation()
        card_states[g] = rot[3] > 90 and rot[3] < 270
      end
    end
  end
end

function update()
  if night_phase then
    for g,v in pairs(card_states) do
      local card = getObjectFromGUID(g)
      local rot = card.getRotation() ---fix needed here
      local state = rot[3] > 90 and rot[3] < 270

      if not state == v then --[[if current state doesnt match state at game start]]
        if v then
          card_states[g] = false
        else
          card_states[g] = true
        end

        if phase_name ~= '' then
          if not string.find(play_list[phase_name], 'Center') then
            aura_list[play_list[phase_name]] = 'looked'
          end

          if phase_name == 'Doppelganger' then
            if dopple_change == '' then
              dopple_change = g_table[g][1]
              dopple_color = play_list['Doppelganger']
              player_list[dopple_color] = 'Dopple-'..dopple_change
              gameData[dopple_color][8]  = 'Dopple-'..dopple_change
              doppleMessage(1)
            elseif dopple_change == 'Paranormal Investigator' and dop_pi_change == '' then
              if g_table[g][1] == 'Werewolf' or g_table[g][1] == 'Alpha Wolf' or g_table[g][1] == 'Mystic Wolf' or g_table[g][1] == 'Dream Wolf' then
                dop_pi_change = 'Werewolf'
                dop_pi_color = play_list['Doppelganger']
                player_list[dopple_color] = 'Dopple-'..dopple_change.."-"..dop_pi_change
                gameData[dopple_color][8] = 'Dopple-'..dopple_change.."-"..dop_pi_change
                piMessage()
              elseif g_table[g][1] == 'Tanner' then
                dop_pi_change = 'Tanner'
                dop_pi_color = play_list['Doppelganger']
                player_list[dopple_color] = 'Dopple-'..dopple_change.."-"..dop_pi_change
                gameData[dopple_color][8] ='Dopple-'..dopple_change.."-"..dop_pi_change
                piMessage()
              elseif g_table[g][1] == 'Vampire' or g_table[g][1] == 'The Count' or g_table[g][1] == 'The Master' then
                dop_pi_change = 'Vampire'
                dop_pi_color = play_list['Doppelganger']
                player_list[dopple_color] = 'Dopple-'..dopple_change.."-"..dop_pi_change
                gameData[dopple_color][8] = 'Dopple-'..dopple_change.."-"..dop_pi_change
                piMessage()
              end
            end
          elseif phase_name == 'Paranormal Investigator' and pi_change == '' then
            if g_table[g][1] == 'Werewolf' or g_table[g][1] == 'Alpha Wolf' or g_table[g][1] == 'Mystic Wolf' or g_table[g][1] == 'Dream Wolf' then
              pi_change = 'Werewolf'
              pi_color = play_list['Paranormal Investigator']
              player_list[pi_color] = pi_change
              gameData[pi_color][8] = 'Werewolf'
              piMessage()
            elseif g_table[g][1] == 'Tanner' then
              pi_change = 'Tanner'
              pi_color = play_list['Paranormal Investigator']
              player_list[pi_color] = pi_change
              gameData[pi_color][8] = 'Tanner'
              piMessage()
            elseif g_table[g][1] == 'Vampire' or g_table[g][1] == 'The Count' or g_table[g][1] == 'The Master' then
              pi_change = 'Vampire'
              pi_color = play_list['Paranormal Investigator']
              player_list[pi_color] = pi_change
              gameData[pi_color][8] = 'Vampire'
              piMessage()
            end
          elseif phase_name == 'Copycat' and cat_change == '' then
            cat_change = g_table[g][1]
            cat_color = play_list['Copycat']
            if cat_change ~= '' then
              player_list[cat_color] = cat_change
              gameData[cat_color][8] = cat_change
            end
            catMessage()
          elseif phase_name == 'Mirror Man' and mirror_change == '' then
            mirror_change = g_table[g][1]
            mirror_color = play_list['Mirror Man']
            if mirror_change  ~= '' then
              player_list[mirror_color] = mirror_change
              gameData[mirror_color][8] = mirror_change
            end
            mirrorMessage()
          elseif phase_name == 'Nostradamus' and nostra_change == '' then
            if g_table[g][1] == 'Werewolf' or g_table[g][1] == 'Alpha Wolf' or g_table[g][1] == 'Mystic Wolf' or g_table[g][1] == 'Dream Wolf' then
              nostra_change = 'Werewolf'
            elseif g_table[g][1] == 'Tanner' or g_table[g][1] == 'Apprentice Tanner' then
              nostra_change = 'Tanner'
            elseif g_table[g][1] == 'Vampire' or g_table[g][1] == 'The Count' or g_table[g][1] == 'The Master' or g_table[g][1] == 'Renfield' then
              nostra_change = 'Vampire'
            elseif g_table[g][1] == 'Assassin' then
              nostra_change = 'Assassin'
            elseif g_table[g][1] == 'Apprentice Assassin' then
              nostra_change = 'Apprentice Assassin'
            elseif g_table[g][1] == 'Temptress' or g_table[g][1] == 'Dr. Peeker' or g_table[g][1] == 'Rapscallion' or g_table[g][1] == 'Henchman #7' then
              nostra_change = 'Villain'
            elseif g_table[g][1] == 'Alien' or g_table[g][1] == 'Synthetic Alien' or g_table[g][1] == 'Body Snatcher' or g_table[g][1] == 'Groob' or g_table[g][1] == 'Zerb' then
              nostra_change = 'Alien'
            end
            if nostra_change ~= '' then
              broadcastToAll("Nostradamus is on the ".. nostra_change .." Team.", "Red")
            end
          elseif phase_name == 'Body Snatcher' and #bodysnatch_change == init_bodysnatch then
            table.insert(bodysnatch_change, init_bodysnatch + 1, {g, g_table[g][1]})
            bodysnatch_color = play_list['Body Snatcher']
            if #bodysnatch_change  > init_bodysnatch then

              player_list[bodysnatch_color] = 'Body Snatcher-'..g_table[g][1]
              gameData[bodysnatch_color][8] = 'Body Snatcher-'..g_table[g][1]
            end

          elseif phase_name == 'Dopple-Nostradamus' and dopple_change == 'Nostradamus' and dop_nostra_change == '' then
            if g_table[g][1] == 'Werewolf' or g_table[g][1] == 'Alpha Wolf' or g_table[g][1] == 'Mystic Wolf' or g_table[g][1] == 'Dream Wolf' then
              dop_nostra_change = 'Werewolf'
            elseif g_table[g][1] == 'Tanner' or g_table[g][1] == 'Apprentice Tanner' then
              dop_nostra_change = 'Tanner'
            elseif g_table[g][1] == 'Vampire' or g_table[g][1] == 'The Count' or g_table[g][1] == 'The Master' or g_table[g][1] == 'Renfield' then
              dop_nostra_change = 'Vampire'
            elseif g_table[g][1] == 'Assassin' then
              dop_nostra_change = 'Assassin'
            elseif g_table[g][1] == 'Apprentice Assassin' then
              dop_nostra_change = 'Apprentice Assassin'
            elseif g_table[g][1] == 'Apprentice Assassin' then
              dop_nostra_change = 'Apprentice Assassin'
            elseif g_table[g][1] == 'Temptress' or g_table[g][1] == 'Dr. Peeker' or g_table[g][1] == 'Rapscallion' or g_table[g][1] == 'Henchman #7' then
              dop_nostra_change = 'Villain'
            elseif g_table[g][1] == 'Nostradamus' then
              dop_nostra_change = nostra_change
            end
            if dop_nostra_change ~= '' then
              broadcastToAll("Dopple-Nostradamus is on the ".. dop_nostra_change .." Team.", "Red")
            end
          elseif phase_name == 'Dopple-Body Snatcher' and dopple_change == 'Body Snatcher' and #dop_bodysnatch_change == init_dopbodysnatch then
            table.insert(dop_bodysnatch_change, init_dopbodysnatch + 1, {g, g_table[g][1]})
            dop_bodysnatch_color = play_list['Doppelganger']
            if #dop_bodysnatch_change  > init_dopbodysnatch then
              player_list[dop_bodysnatch_color] = 'Dopple-'..dopple_change..'-'..g_table[g][1]
              gameData[dop_bodysnatch_color][8] = 'Dopple-'..dopple_change..'-'..g_table[g][1]
            end
          end
        end
      end
    end



    if play_list[phase_name] ~= nil then
    for i,v in ipairs(color_list) do
      if Player[v].seated and Player[v].blindfolded == false and player_list[v] ~= nil then
        if OchosenOne[v] ~= nil then
          --do nothing, they're legit
        elseif RchosenOne[v] ~= nil then
          --do nothing, they're legit
        elseif (player_list[v] == phase_name) or ((string.find(player_list[v], 'Dopple')) and phase_name == 'Doppelganger') then
          --do nothing, they're legit
        elseif ((string.find(player_list[v], 'Dopple')) and (dopple_change == phase_name) and (phase_name == 'Werewolf' or phase_name == 'Mason')) then
          --do nothing, they're legit
        elseif player_list[v] == 'The Count' and phase_name == 'Vampire' or player_list[v] == 'The Master' and phase_name == 'Vampire' or player_list[v] == 'Dopple-The Master' and phase_name == 'Vampire' or player_list[v] == 'Dopple-The Count' and phase_name == 'Vampire' or player_list[v] == 'Dopple-Vampire' and phase_name == 'Vampire'   then
          --do nothing, they're legit
        elseif (string.find(player_list[v], 'Dopple')) and (phase_name == 'Werewolf' and (dopple_change == 'Alpha Wolf' or dopple_change == 'Mystic Wolf')) then
          --do nothing, they're legit
        elseif (player_list[v] == 'Alpha Wolf' and phase_name == 'Werewolf') or (player_list[v] == 'Mystic Wolf' and phase_name == 'Werewolf') then
          --do nothing, they're legit
        elseif (player_list[v] == 'Temptress' or player_list[v] == 'Dr. Peeker' or player_list[v] == 'Rapscallion' or player_list[v] == 'Henchman #7' or player_list[v] == 'Dopple-Temptress' or player_list[v] == 'Dopple-Dr. Peeker' or player_list[v] == 'Dopple-Rapscallion' or player_list[v] == 'Dopple-Henchman #7' and phase_name == 'Villains') then
          --do nothing, they're legit
        elseif (player_list[v] == 'Alien' or player_list[v] == 'Synthetic Alien' or  player_list[v] == 'Groob' or player_list[v] == 'Zerb' or player_list[v] == 'Body Snatcher' or player_list[v] == 'Dopple-Alien' or player_list[v] == 'Dopple-Synthetic Alien' or  player_list[v] == 'Dopple-Groob' or player_list[v] == 'Dopple-Zerb' or player_list[v] == 'Dopple-Body Snatcher') and phase_name == 'Alien' then
          --do nothing, they're legit
        elseif (player_list[v] == 'Groob' or player_list[v] == 'Zerb' or player_list[v] == 'Dopple-Groob' or player_list[v] == 'Dopple-Zerb') and phase_name == 'Groob and Zerb' then
          --do nothing, they're legit
        elseif v == cat_color and phase_name == 'Copycat' then
          --do nothing, they're legit
        elseif v == mirror_color and phase_name == 'Mirror Man' then
          --do nothing, they're legit
        elseif v == pi_color and phase_name == 'Paranormal Investigator' then
          --do nothing, they're legit
        elseif phase_name == 'Lovers' and (gameData[v][18] == '305c28' or gameData[v][18] == '6bcd9d'  or gameData[v][18] == 'ae80db'  or gameData[v][18] == 'f4902d') then
          --do nothing, they're legit
        elseif phase_name == 'Oracle' and v == oracle_color then
          --do nothing, they're legit.
        elseif phase_name == 'Ripple' and (chosenOne[v]~=nil or chosenTwo[v]~=nil or rippleInsomPlayerzz[v]~=nil) then
        elseif phase_name == 'Body Snatcher' and (player_list[v] == 'Body Snatcher' or v == bodysnatch_color) then
        elseif phase_name == 'Dopple-Body Snatcher' and (player_list[v] == 'Dopple-Body Snatcher' or v == dop_bodysnatch_color) then
        else
          broadcastToAll(gameData[v][7] .. " has removed their blindfold out of turn.", "Red")
          Player[v].blindfolded = true
        end
      end
    end
    end

    noiseMake()
  end
end


function timeRefresh(timeleft)
  if math.floor(timeleft) ~= timeleft then
    local holup = timeleft - math.floor(timeleft)
    waitid = Wait.time(function() timeRefresh(math.floor(timeleft)) end,holup)
    table.insert(wait_ids, waitid)
    UI.setXml('')
    xml = '<Text id="timelabel" offsetXY="-750 515" fontSize="20" color="White" active="false">Time left in phase:</Text><Text id="timeleft" offsetXY="-750 460" fontSize="100" color="White" active="false">Words</Text><Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>'
    if phase_name == 'Oracle' then
      finalxml = xml .. OracleXml
    elseif phase_name == 'Empath' then
        finalxml = xml .. empathXml
      elseif phase_name == 'Village Idiot' or  phase_name == 'Dopple-Village Idiot' or (phase_name=='Rascal' and rascalRole=='Village Idiot') then
        finalxml = xml .. VIxml
      elseif phase_name == 'Troublemaker' or phase_name == 'Switcheroo' or (phase_name=='Rascal' and rascalRole=='Troublemaker')  then
        finalxml = xml .. MMXml
      elseif phase_name == 'Thing' or phase_name == 'Annoying Lad' then
        finalxml = xml .. ThingXml
      elseif phase_name == 'Gremlin' or phase_name == 'Dopple-Gremlin' then
        finalxml = xml .. Gxml
      elseif phase_name == 'Vampire' or phase_name == 'The Count' or phase_name == 'Diseased' or phase_name == 'Cupid' or phase_name == 'Instigator' or phase_name == 'Priest' or phase_name == 'Assassin' or phase_name == 'Apprentice Assassin' or phase_name == 'Pickpocket'  then
        finalxml = xml .. SwapXml
      elseif phase_name == 'Dopple-The Count' or phase_name == 'Dopple-Priest' or phase_name == 'Dopple-Assassin' or phase_name == 'Dopple-Apprentice Assassin' or phase_name == 'Dopple-Pickpocket' then
        finalxml = xml .. SwapXml
      else
        finalxml = xml
      end
      UI.setXml(finalxml)
    elseif play_list[phase_name] ~= nil then
      other_time = timeleft
      UI.setAttribute("timelabel","active","true")
      UI.setAttribute("timeleft","active","true")



      if timeleft ~= nil then
        UI.setAttribute("timeleft","text",timeleft)


        if timeleft > 0 then
          --UI.setXml(xml)
          timeleft = timeleft - 1
          waitid = Wait.time(function() timeRefresh(timeleft) end,1)

          table.insert(wait_ids, waitid)
        else
          VIxml = ''
          SwapXml = ''
          UI.setXml('<Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>')

        end
      end
    end
  end

function doubleCheck()
  --(1) is the color playing the game?
  --(2) guid for the area associated with the color
  --(3) position for placing decals
  --(4) rotation for placing decals
  --(5) position to draw vote line from
  --(6) position to draw vote line to (if being voted against)
  --(7) player steam name
  --(8) player starting role
  --(9) player end role
  --(10) color that player voted for
  --(11) number of votes against player
  --(12) have they made a claim?
  --(13) RGB for the color
  --(14) Card position
  --(15) Card Rotation
  --(16) guid of area above card for artifact
  --(17) guid of area in front of card for mark
  --(18) guid of mark in mark zone
  --(19) team player is on
  --(20) text area for color
  --(21) text in textarea
  gameData = {}
  gameData['White'] =  {false,'8a680a',{11.7, 0.96,-11.4},{90, -30, 0},{14.2,1,-13.4},{12.1,1,-14.6},"null","null","null","null",0,false,{1, 1, 1},{14.02, 0.97,-15.45},{0,150,180},'fd9417','203d60', "null", "null",'204ec6','null'}
  gameData['Pink'] =   {false,'64f12f',{20.1, 0.96, -6.7},{90, -75, 0},{23.3,1,-6.4},{22.8,1,-8.6},"null","null","null","null",0,false,{0.96, 0.439, 0.807},{24.58,0.97,-7.92},{0,105,180},'d00b88','121f30', "null", "null",'eb9a00','null'}
  gameData['Purple'] = {false,'5a42e7',{20.1, 0.96, 6.7},{90, -105, 0},{22.8,1,8.6},{23.3,1,6.4},"null","null","null","null",0,false,{0.627, 0.125, 0.941},{24.59,0.97,7.88},{0,75,180},'24c21d','14a4bb', "null", "null",'759be9','null'}
  gameData['Blue'] =   {false,'a8cf37',{11.7, 0.96,11.4},{90, -150, 0},{12.1,1,14.6},{14.2,1,13.4},"null","null","null","null",0,false,{0.118, 0.53, 1},{14.06,0.97,15.44},{0,30,180},'f5741b','a07db0', "null", "null",'db834c','null'}
  gameData['Teal'] =   {false,'62ae88',{0, 0.96, 12.5},{90, -180, 0},{-1.13,1,15.4},{1.18,1,15.4},"null","null","null","null",0,false,{0.129, 0.694, 0.607},{0.01,0.97,17.12},{0,0,180},'a965e8','3ac487', "null", "null",'8fa818','null'}
  gameData['Green'] =  {false,'47ed60',{-11.7, 0.96, 11.4},{90, -210, 0},{-14.2,1,13.4},{-12.1,1,14.6},"null","null","null","null",0,false,{0.192, 0.701, 0.168},{-14.03,0.97,15.45},{0,330,180},'4cb519','c7c2ba', "null", "null",'042472','null'}
  gameData['Yellow'] = {false,'acd8bd',{-20.1, 0.96, 6.7},{90, 105, 0},{-22.8,1,8.6},{-23.3,1,6.4},"null","null","null","null",0,false,{0.905, 0.898, 0.172},{-24.58,0.97,7.89},{0,285,180},'d96afd','e8f0fb', "null", "null",'620554','null'}
  gameData['Orange'] = {false,'b9d363',{-20.1, 0.96, -6.7},{90, 75, 0},{-22.8, 1, -8.6},{-23.3,1,-6.4},"null","null","null","null",0,false,{0.956, 0.392, 0.113},{-24.56,0.97,-7.91},{0,255,180},'05a44e','67ca28', "null", "null",'02153a','null'}
  gameData['Red'] =    {false,'3995fc',{-11.7, 0.96,-11.4},{90, 30, 0},{-12.1,1,-14.6},{-14.2,1,-13.4},"null","null","null","null",0,false,{0.856, 0.1, 0.094},{-14.01,0.97,-15.45},{0,210,180},'0fe72c','24e89c', "null", "null",'15989a','null'}
  gameData['Brown'] =  {false,'ce2ce1',{0, 0.96, -12.5},{90, 0, 0},{1.18,1,-15.4},{-1.13,1,-15.4},"null","null","null","null",0,false,{0.443, 0.231, 0.09},{0.03,0.97,-17.14},{0,180,180},'c3a36a','7eaea2', "null", "null",'341103','null'}

  printToAll("Everyone, close your eyes...", {1,1,0})
  cancelxml = '<Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>'
  UI.setXml(cancelxml)
  startGame()
end

function wakePlayers()
  local playerOracle = false
  --automatically wakes up any players who do actions during this phase
  for i,c in ipairs(color_list) do
    if not night_phase then
      Player[c].unblind()
    elseif gameData[c][18] =='8fc618' or gameData[c][18] == '0b33f9' then --do not unblindfold if they have mark of fear.
      --do nothing

    elseif phase_name == 'Ripple' then
      if rippleInsom == true then
        if rippleInsomPlayerzz[c] ~= nil then
          Player[c].unblind()
        end
      elseif chosenOne[c] ~= nil then
        Player[c].unblind()
      elseif chosenTwo[c] ~= nil then
        Player[c].unblind()
	  elseif RchosenOne[c] ~= nil then
        Player[c].unblind()
      end
    elseif player_list[c] == phase_name and phase_name == 'Oracle' then
      playerOracle = true
	  oracleUI(c)
      Player[c].unblind()
	elseif player_list[c] == phase_name and phase_name == 'Village Idiot' then
      villageIdiotUI(c)
      Player[c].unblind()
    elseif player_list[c] == phase_name and phase_name == 'Gremlin' then
      gremlinUI(c)
      Player[c].unblind()
    elseif player_list[c] == phase_name and phase_name == 'Renfield' then
      Player[c].unblind()
      waitid = Wait.time(involswapMarks,3)
		  table.insert(wait_ids, waitid)
    elseif player_list[c] == phase_name and phase_name == 'Priest' then
      Player[c].unblind()
      waitid = Wait.time(involswapMarks,3)
		  table.insert(wait_ids, waitid)
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'The Count' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Assassin' then
      no_assassin = false
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Apprentice Assassin' and no_assassin then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Cupid' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Instigator' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Diseased' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Pickpocket' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Pickpocket' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Dopple-The Count' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Gremlin' then
      gremlinUI(c)
      Player[c].unblind()
    elseif player_list[c] == phase_name and phase_name == 'Troublemaker' then
      gswapui(c, "-1", "Cards")
      Player[c].unblind()
	elseif player_list[c] == phase_name and phase_name == 'Rascal' then
	  Player[c].unblind()
	  if rascalRole == 'Troublemaker' then
		    gswapui(c, "-1", "Cards")
	  elseif rascalRole == 'Village Idiot' then
		    villageIdiotUI(c)
	  end
	elseif player_list[c] == phase_name and phase_name == 'Switcheroo' then
      gswapui(c, "-1", "Cards")
      Player[c].unblind()
    elseif player_list[c] == phase_name and phase_name == 'Thing' then
      thingUI()
      Player[c].unblind()
	elseif player_list[c] == phase_name and phase_name == 'Annoying Lad' then
      thingUI()
      Player[c].unblind()
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Renfield' then
      Player[c].unblind()
      waitid = Wait.time(involswapMarks,3)
		  table.insert(wait_ids, waitid)
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Priest' then
      Player[c].unblind()
      waitid = Wait.time(involswapMarks,3)
		  table.insert(wait_ids, waitid)
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Assassin' then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name and phase_name == 'Dopple-Apprentice Assassin' and no_assassin then
      Player[c].unblind()
      swapMarksUI("a", "b")
    elseif player_list[c] == phase_name then
      Player[c].unblind()
    elseif phase_name == 'Werewolf' then
      if player_list[c] == 'Alpha Wolf' or player_list[c] == 'Mystic Wolf' then
        Player[c].unblind()
      end
	elseif phase_name == 'Villains' then
      if (player_list[c] == 'Temptress' or player_list[c] == 'Dr. Peeker' or player_list[c] == 'Rapscallion' or player_list[c] == 'Henchman #7' or player_list[c] == 'Dopple-Temptress' or player_list[c] == 'Dopple-Dr. Peeker' or player_list[c] == 'Dopple-Rapscallion' or player_list[c] == 'Dopple-Henchman #7') and phase_name == 'Villains' then
        Player[c].unblind()
      end
	elseif phase_name == 'Alien' then
	  if (player_list[c] == 'Alien' or player_list[c] == 'Synthetic Alien' or  player_list[c] == 'Groob' or player_list[c] == 'Zerb' or player_list[c] == 'Body Snatcher' or player_list[c] == 'Dopple-Alien' or player_list[c] == 'Dopple-Synthetic Alien' or  player_list[c] == 'Dopple-Groob' or player_list[c] == 'Dopple-Zerb' or player_list[c] == 'Dopple-Body Snatcher') then
		Player[c].unblind()
	  end
	elseif phase_name == 'Groob and Zerb' then
	  if player_list[c] == 'Groob' or  player_list[c] == 'Zerb' or  player_list[c] == 'Dopple-Groob' or  player_list[c] == 'Dopple-Zerb' then
		Player[c].unblind()
	  end
    elseif phase_name == 'Vampire' then
      if player_list[c] == 'The Master' or player_list[c] == 'The Count' then
        Player[c].unblind()
      end
    elseif phase_name == 'Lovers' then
      if (gameData[c][18] == '305c28' or gameData[c][18] == '6bcd9d'  or gameData[c][18] == 'ae80db'  or gameData[c][18] == 'f4902d') then
        Player[c].unblind()
      end
	elseif OchosenOne[c] ~= nil then
		Player[c].unblind()
	elseif RchosenOne[c] ~= nil then
		Player[c].unblind()
    end
  end
  
  if phase_name == 'Oracle' and playerOracle == false then
	oracleUI("NONE")
  end

  if phase_name == 'Vampire' then
    swapMarksUI("a","b")
    if dopple_change == 'Vampire' or dopple_change == 'The Count' or dopple_change == 'The Master' then
      Player[dopple_color].unblind()
    end
  elseif phase_name == 'Werewolf' then
    if dopple_change == 'Werewolf' or dopple_change == 'Alpha Wolf' or dopple_change == 'Mystic Wolf'   then
      Player[dopple_color].unblind()
    end
  elseif phase_name == 'Mason' then
    if dopple_change == 'Mason' then
      Player[dopple_color].unblind()
    end
  end
end

function doppleMessage(num)
  if Player[dopple_color].seated then
    if dopple_change == 'Doppelganger' then
      dopple_change = ''
      if dopple_message_dopple ~= true then
        printToColor(' ', dopple_color, {0,0,0})
        printToColor("You can't become yourself, look at another card.", dopple_color, {0.118, 0.53, 1})
        dopple_message_dopple = true
      end
    elseif num == 1 then
      printToColor(' ', dopple_color, {0,0,0})
      printToColor('You became '..player_list[dopple_color]..'!', dopple_color, {0.118, 0.53, 1})
    end
    if dopple_role_list[dopple_change] ~= nil then
      if num == 2 then
        printToColor(' ', dopple_color, {0,0,0})
      end
      printToColor(dopple_role_list[dopple_change][num], dopple_color, {0.118, 0.53, 1})
      if dopple_change == 'Minion' then
        minionText()
      elseif dopple_change == 'Village Idiot' then
        villageIdiotUI(dopple_color)
      elseif dopple_change == 'Diseased' or dopple_change == 'Cupid' or dopple_change == 'Instigator' then
        swapMarksUI("a", "b")
      elseif dopple_change == 'Troublemaker' or dopple_change == 'Switcheroo' then
        gswapui(dopple_color, "-1", "Cards")
      elseif dopple_change == 'Thing' or dopple_change == 'Annoying Lad'   then
        thingUI()
      end
    end
  end
end

function minionText()
  local wolves  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Werewolf' or player_list[c] == 'Dopple-Werewolf' or player_list[c] == 'Alpha Wolf' or player_list[c] == 'Mystic Wolf' or player_list[c] == 'Dopple-Alpha Wolf' or player_list[c] == 'Dopple-Mystic Wolf' then
      local tmp = {
        name = "Werewolf",
        url = "http://cloud-3.steamusercontent.com/ugc/1290793971949215940/85D25921F6A4544995628420A26574B641CC5016/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(wolves, tmp)
    elseif player_list[c] == 'Dream Wolf' or player_list[c] == 'Dopple-Dream Wolf' then
      local tmp = {
        name = "Dream Wolf",
        url = "http://cloud-3.steamusercontent.com/ugc/1468688531114565922/D9515C345F32A8102968977867137C829E3AACDD/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(wolves, tmp)
    end
  end
  Global.setDecals(wolves)
end

function masonText()
  local masons  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Mason' or player_list[c] == 'Dopple-Mason' then
      local tmp = {
        name = "Mason",
        url = "http://cloud-3.steamusercontent.com/ugc/1290793971949214315/21A13BCC7E21F1FA73172A552CCA84EB0409CB0E/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(masons, tmp)
    end
  end
  Global.setDecals(masons)
end

function renfieldText()
  local vampires  = {}
  for i,c in ipairs(color_list) do
    if gameData[c][1] == true then
      if (player_list[c] == 'Vampire' or player_list[c] == 'The Master'  or player_list[c] == 'The Count' or player_list[c] == 'Dopple-Vampire' or player_list[c] == 'Dopple-The Master'  or player_list[c] == 'Dopple-The Count') then
        local tmp = {
          name = "Vampire",
          url = "http://cloud-3.steamusercontent.com/ugc/1468689039028723311/1910A4EA6CD70F2DA1986AD22ADA582692408C70/",
          position = gameData[c][3],
          rotation = gameData[c][4],
          scale = {4,5,5},
        }
        table.insert(vampires, tmp)
      end

      vampmarkzone = getObjectFromGUID(gameData[c][17])
      if phase_name == 'Renfield' and (vampmarkzone.getObjects() ~= nil) then
        ----print(vampmarkzone)
        vampmark = vampmarkzone.getObjects()
        if vampmark[1].guid == '674c02' then
          local tmp = {
            name = "Vampire",
            url = "http://cloud-3.steamusercontent.com/ugc/1468689234271595591/9549F6733F546B182A4878BF2FC90A6C0282C2E6/",
            position = gameData[c][3],
            rotation = gameData[c][4],
            scale = {4,4,4},
          }
          table.insert(vampires, tmp)
        end
      end
      ----print(gameData[c][17])
    end
  end
  Global.setDecals(vampires)
end

function beholderText()
  local seers  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Seer' or player_list[c] == 'Dopple-Seer'  or player_list[c] == 'Apprentice Seer' or player_list[c] == 'Apprentice Seer' then
      local tmp = {
        name = "Seer",
        url = "http://cloud-3.steamusercontent.com/ugc/1290793971949220339/37FCECB82226CDFF3347DE41A923EEB01CD56AB9/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(seers, tmp)
    end
  end
  Global.setDecals(seers)
end

function tannerText()
  ----print("Tanner text called")
  local tanner  = {}
  apptanner_color = 'null'
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Apprentice Tanner' then
      apptanner_color = c
      ----print('set picked up apptanner color')
    end

    if player_list[c] == 'Tanner' or player_list[c] == 'Dopple-Tanner' then
      local tmp = {
        name = "Tanner",
        url = "http://cloud-3.steamusercontent.com/ugc/1290793971949221527/9D4EF54B4F46DADE16CE6AC5339A1CD69AC6682C/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(tanner, tmp)
    end
  end

  ----print(apptanner_color) --need to fix cheat check
  --  if #tanner == 0 then
  ----print('no tanners')
  --player_list[apptanner_color] = 'Tanner'
  -- end

  Global.setDecals(tanner)
end

function internText()
  local madsci  = {}
  apptanner_color = 'null'
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Intern' then
      intern_color = c
      ----print('set picked up apptanner color')
    end

    if player_list[c] == 'Mad Scientist' or player_list[c] == 'Dopple-Mad Scientist' then
      local tmp = {
        name = "Mad Scientist",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873290230/D77F089DC53497C8EF76FBFA03BF24DA1E6E017B/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(madsci, tmp)
    end
  end

  Global.setDecals(madsci)
end

function villainsText()
  local villains  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Temptress' or player_list[c] == 'Dopple-Temptress' then
      local tmp = {
        name = "Temptress",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873292933/635C7A8951D43CC4A1F116A95CBCAB8D8FBD2222/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(villains, tmp)
    elseif player_list[c] == 'Dr. Peeker' or player_list[c] == 'Dopple-Dr. Peeker' then
      local tmp = {
        name = "Dr. Peeker",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873291066/DFDB004DD879F4948E06C3D730D1430471C38943/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(villains, tmp)
    elseif player_list[c] == 'Rapscallion' or player_list[c] == 'Dopple-Rapscallion' then
      local tmp = {
        name = "Rapscallion",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873291427/E1B14DB65426E8E5CD51DFEDCF527F14F80BAF22/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(villains, tmp)
    elseif player_list[c] == 'Henchman #7' or player_list[c] == 'Dopple-Henchman #7' then
      local tmp = {
        name = "Henchman #7",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873288596/B88C4AEB7F1F9C36562AF55A7626AC8581F023A8/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(villains, tmp)
	elseif player_list[c] == 'Evilometer' or player_list[c] == 'Dopple-Evilometer' then
      local tmp = {
        name = "Evilometer",
        url = "http://cloud-3.steamusercontent.com/ugc/1485578739873287978/767AFB5BD375D93AD01EE6B95DF1A98E254C70A3/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(villains, tmp)
    end
  end

  Global.setDecals(villains)
end

function alienText()
  local aliens  = {}
  for i,c in ipairs(color_list) do
    if (player_list[c] == 'Alien' or player_list[c] == 'Synthetic Alien' or player_list[c] == 'Groob' or player_list[c] == 'Zerb'  or player_list[c] == 'Body Snatcher' or player_list[c] == 'Dopple-Alien' or player_list[c] == 'Dopple-Synthetic Alien' or player_list[c] == 'Dopple-Groob' or player_list[c] == 'Dopple-Zerb'  or player_list[c] == 'Dopple-Body Snatcher' or c == bodysnatch_color or c == dop_bodysnatch_color) and phase_name == 'Alien' then
      local tmp = {
        name = "Alien",
        url = "http://cloud-3.steamusercontent.com/ugc/1488957142296480083/4B23414D97D6FD0AF22230B229EB668629B0B4B4/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(aliens, tmp)
    elseif (player_list[c] == 'Cow' or player_list[c] == 'Dopple-Cow') and phase_name == 'Alien' then
      local tmp = {
        name = "Cow",
        url = "http://cloud-3.steamusercontent.com/ugc/1488957142296482836/1F30826FAAA824A58D7A59968DB522FD8BA004D7/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(aliens, tmp)
	elseif (player_list[c] == 'Groob' or player_list[c] == 'Dopple-Groob' or player_list[c] == 'Zerb' or player_list[c] == 'Dopple-Zerb') and phase_name =='Groob and Zerb' then
      local tmp = {
        name = "Alien",
        url = "http://cloud-3.steamusercontent.com/ugc/1488957142296480083/4B23414D97D6FD0AF22230B229EB668629B0B4B4/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(aliens, tmp)
	elseif (player_list[c] == 'Groob' or player_list[c] == 'Dopple-Groob' or player_list[c] == 'Zerb' or player_list[c] == 'Dopple-Zerb') and phase_name =='Leader' then
      local tmp = {
        name = "Alien",
        url = "http://cloud-3.steamusercontent.com/ugc/1488957328907833299/F79F2D978028A7D58BB48EFE7B77D5EEC170C67D/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(aliens, tmp)
	elseif (player_list[c] == 'Alien' or player_list[c] == 'Synthetic Alien' or player_list[c] == 'Body Snatcher' or player_list[c] == 'Dopple-Alien' or player_list[c] == 'Dopple-Synthetic Alien' or player_list[c] == 'Dopple-Body Snatcher' or c == bodysnatch_color or c == dop_bodysnatch_color) and  phase_name =='Leader' then
      local tmp = {
        name = "Alien",
        url = "http://cloud-3.steamusercontent.com/ugc/1488957142296480083/4B23414D97D6FD0AF22230B229EB668629B0B4B4/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(aliens, tmp)
    end
  end

  Global.setDecals(aliens)
end

function startGame()
  clearUnknownsText()
  role_list = {
  {'Sentinel', 6.922, "Sentinel! Wake up. You MAY place a shield token on another player's card.",2.325},
  {'Copycat', 9.979, "Copycat! Wake up. You MUST look at a card in the center. You are now that role, and will wake when it normally would.",2.638},
  {'Mirror Man', 10.371, "Mirror Man! Wake up. You MUST look at a card in the center. You are now that role, and will wake when it normally would.",2.22},
  {'Oracle', 4.127, "Oracle! Wake up, and answer the following question: ",2.064},
  {'Doppelganger', 7.158, "Doppelganger! Wake up. You MUST look at another player's card. You are now that role. (Further instructions will be sent to you)",2.560},
  {'Vampire', 8.072, "Vampires! Wake up, and look for other Vampires. Collectively, you MUST swap any non-Vampire player's Mark with the Mark of the Vampire.",2.847},
  {'The Count', 6.557, "Count! Wake up. You MUST swap any non-Vampire player's Mark with the Mark of Fear.",1.881},
  {'Renfield', 3.997, "Renfield! Wake up. You will be shown who the Vampires are and who they gave the Mark of the Vampire to. You must swap your Mark with the Mark of the Bat (the script does this for you.)",1.907},
  {'Diseased', 7.340, "Diseased! Wake up. You MUST swap the Mark of Disease with the Mark of a player adjacent to you.",1.985},
  {'Cupid', 4.859, "Cupid! Wake up. You MAY swap up to two Marks of Love with the Marks of any two players.",1.881},
  {'Instigator', 5.407, "Instigator! Wake up. You MAY swap any player's Mark with a Mark of the Traitor.", 2.429},
  {'Priest', 4.78, "Priest! Wake up. You MUST swap your mark with a Mark of Clarity (the script does this for you) and MAY place a Mark of Clarity in front of one other player.", 1.829},
  {'Assassin', 5.878, "Assassin! Wake up. You MUST swap any other player's Mark with the Mark of the Assassin on any player. After using the UI to place the Mark, you will learn who the Apprentice Assassin is.",2.220},
  {'Apprentice Assassin', 9.509, "Apprentice Assassin! Wake up and look for the Assassin. If there is no Assassin, you MUST swap any player's Mark with the Mark of the Assassin.", 2.821},
  {'Intermission', 5.1, "Dusk transitions to night. A spooky red ghost tells you what Mark you have...",1},
  {'Lovers', 4.415, "If you are in Love, wake up and look for your love interest.", 1.646},
  {'Sentinel', 6.922, "Sentinel! Wake up. You MAY place a shield token on another player's card.",2.325},
  {'Alien', 4.075, "Aliens! Wake up, and look for other Aliens.",2.038},
  {'Groob and Zerb', 3.709, "Groob and Zerb! Wake up, and look at eachother.",2.638},
  {'Body Snatcher', 2.847, "Body Snatcher! Wake up. ",2.090},
  {'Villains', 9.535, "Villains! Wake up and look for other Villains...",4.467,},
  {'Werewolf', 9.064, "Werewolves! Wake up. If you are the only werewolf you MAY look at a card in the center.",2.534},
  {'Alpha Wolf', 6.740, "Alpha Wolf! Wake up. You MUST switch the center werewolf card with the card of a non-wolf player.",2.873},
  {'Mystic Wolf', 5.616, "Mystic Wolf! Wake up. You MAY look at another player's card.",2.926},
  {'Minion', 3.370, "Minion! Wake up. You will be shown who the werewolves are, if there are any.",2.064},
  {'Apprentice Tanner', 3.788, "Apprentice Tanner! Wake up and look for the Tanner. If there is no tanner. You assume the role of a Tanner.", 2.691},
  {'Leader', 4.78, "Leader! Wake up. You will be shown who the Aliens are (Groob and Zerb will have a blue background), if there are any.",1.776},
  {'Intern', 12.147, "Intern! Wake up and look for the Mad Scientist. If there is no Mad Scientist... panic! You assume the role of the Mad Scientist", 2.142},
  {'Mason', 3.605, "Masons! Wake up, and see if there are any other masons.",2.011},
  {'Thing', 6.191, "Thing! Wake up. You MAY tap the player on your right or the player on your left.", 1.620},
  {'Annoying Lad', 7.367, "Annoying Lad! Wake up. You MAY tap the player on your right or the player on your left.", 4.598},
  {'Seer', 7.158, "Seer! Wake up. You MAY look at another player's card, OR two of the center cards.",2.011},
  {'Apprentice Seer', 5.878, "Apprentice Seer! Wake up. You MAY look at a card in the center.",3.213},
  {'Paranormal Investigator', 15.752, "Paranormal Investigator! Wake up. You MAY look at up to two player's cards. If you see a werewolf or tanner, you MUST stop, and you become a Werewolf or Tanner.",3.553},
  {'Marksman', 6.191, "Marksman! Wake up. You MAY view the card of one player and/or another player's Mark (but not the same player if viewing both a Mark and a card).", 1.776},
  {'Nostradamus', 11.442, "Nostradamus! Wake up. You MAY look at up to three cards. If you see any card that isn't on the villager team, stop. The last card you look at is the team you are on.",2.429},
  {'Psychic', 1.672, "Psychic! Wake up.",1.907},
  {'Detector', 9.456, "Detector! Wake up. You MAY look at a player's card, OR two of the center cards.", 6.661},
  {'Robber', 8.542, "Robber! Wake up. You MAY exchange your card with another player's card and then view your new card.",2.220},
  {'Witch', 10.188, "Witch! Wake up. You MAY look at a card in the center, then switch it with any player's card.",2.769},
  {'Pickpocket', 7.758, "Pickpocket! Wake up. You may exchange your Mark with another player's Mark, and then view your new Mark.", 1.985},
  {'Role Retriever', 17.92, "Role Retriever! Wake up. You MAY exchange your card with another player's card and then view your new card.", 5.695},
  {'Voodoo Lou', 15.543, "Voodoo Lou! Wake up. You MAY look at a card in the center, then switch it with any player's card.", 2.847},
  {'Troublemaker', 6.113, "Troublemaker! Wake up. You MAY exchange cards between two other players. But don't look at them.",2.273},
  {'Village Idiot', 7.941, "Village Idiot! Wake up. You MAY move everyone's cards, except your own, to the left or to the right.",2.847},
  {'Aura Seer', 8.098, "Aura Seer! Wake up. You will be shown what players have moved or looked at cards.", 3.004},
  {'Gremlin', 5.982, "Gremlin! Wake up. You MAY switch Marks or cards (but not both) between any two players (including yourself). But don't look at them.", 1.907},
  {'Rascal', 1.776, "Rascal! Wake up.",2.064},
  {'Switcheroo', 8.568, "Switcheroo! Wake up. You MAY exchange cards between two other players. But don't look at them.", 2.22},
  {'Drunk', 4.885, "Drunk! Wake up. You MUST switch your card with a card in the center. But don't look at it.",2.194},
  {'Insomniac', 3.997, "Insomniac! Wake up and look at your card.",2.534},
  {'Self-Awareness Girl', 5.564, "Self-Awareness Girl! Wake up and look at your card.", 5.198},
  {'Squire', 7.288, "Squire! Wake up.  You will be shown which players started as Werewolves. You may view their cards to see if they have been switched.", 1.776},
  {'Family Man', 2.55, "Family Man! Wake up and look at ",2.377},
  {'Beholder', 9.691, "Beholder! Wake up. You will be shown which players started as the Seer and Apprentice Seer. You may view their cards to see if they have been switched.",2.168},
  {'Revealer', 12.304, "Revealer! Wake up. You MAY flip over any other player's card. If it is a werewolf or tanner, flip it back over.",2.873},
  {'Exposer', 2.064, "Exposer! Wake up.",2.377},
  {'Flipper', 9.273, "Flipper!  Wake up. You MAY flip over any other player's card. If it is not on the Hero Team, flip it back over.", 1.985},
  {'Empath', 1.698, "Empath! Wake up.",2.011},
  {'Curator', 7.419, "Curator! Wake up. You MAY place an artifact token on any player's card.",2.769},
  {'Blob', 0.653, "Blob! ",1},
  {'Mortician', 1.698, "Mortician! Wake up.",2.038},
  {'Ripple', 0.1, "",0}
  }
  UI.setAttribute("usurpOrange","active","false")
  a_tvalue = 0
  gtvalue = 300
  originalRoles ={}
  dop_imm_action = {}
  addition_villain_time = {}
  wait_ids = {}
  getCardsUsedInGame()
  epic_battle = false
  clearVectorPaint()
  claims = {}
  chosenOne = {}
  chosenTwo = {}
  chosenTwo = {}
  RchosenOne = {}
  OchosenOne = {}
  rippleInsomPlayerz = {}
  Global.setDecals({})
  checkFlip()
  dopple_change = ''
  pi_change = ''
  dop_pi_change = ''
  bodysnatch_change = {}
  bodysnatch_color = ''
  dop_bodysnatch_color = ''
  init_bodysnatch = 0
  dop_bodysnatch_change = {}
  init_dopbodysnatch = 0
  dop_nostra_change = ''
  cat_change = ''
  mirror_change = ''
  nostra_change = ''
  play_list = {}
  player_list = {}
  aura_list = {}
  playerc_list = {}
  phase = 0
  Shrouded_Player = ''
  numplayers = 0
  phase_name = ''
  SwapXml = ''
  Gxml = ''
  MMXml = ''
  VIxml = ''
  ThingXml = ''
  finalxml = ''
  onuv = false
  onua = false
  tdrs_inplay = false
  min_inplay = false
  tmptres_inplay = false
  dpeek_inplay = false
  rap_inplay = false
  hench_inplay = false
  ripplerepeat  = false
  ripplerepeatonep = false
  dopple_message_dopple = false
  oracleForceAlien = false
  oracleForceRipple = false
  firstripple = true
  numcards = 0
  timeleft = 0
  dw_inplay = false
  no_assassin = true
  clearVectorPaint()
  removeResetButton()

  for i,v in pairs(areas) do
    --[[checks all the scripting zones and logs the role cards in them,
    there is a zone for each player and a zone in the middle.]]
    zone = getObjectFromGUID(v[1])
    cards = zone.getObjects()
    for o,c in ipairs(cards) do
      g = c.guid
      if g_table[g] ~= nil then
        numcards = numcards + 1
        play_list[g_table[g][1]] = v[2] --logs all the roles in this game (color or center)
        player_list[v[2]] = g_table[g][1] --logs the role of each player
		originalRoles[v[2]] = g_table[g][1]
        ----print(v[2], g_table[g][1])
        if g_table[g][1] == "Minion" then
          role_list[5][2] = role_list[5][2] + 3.291
          min_inplay = true
        end
        if g_table[g][1] == "Dream Wolf" then
          role_list[18][2] = 11.572
          dw_inplay = true
        end
      end
    end
  end



  new_play_list = {}
  local iterr = 1
  for i,v in pairs(role_list) do
    if play_list[v[1]] ~= nil then
      table.insert(new_play_list, iterr, v[1])
      iterr = iterr + 1
    end
  end

  dop_imm_action[1] = {1.332,22}
  dop_imm_action[2] = {0.522,37}
  dop_imm_action[3] = {2.220,45}
  local iter = 4
  local villainIter = 1
  for i,v in pairs(new_play_list) do
	----print(v)
    if init_dop_imm_action[v] ~= nil then
      local tmp_insert = init_dop_imm_action[v]
      table.insert(dop_imm_action, iter, tmp_insert)
      iter = iter + 1
      role_list[5][2] = role_list[5][2] + init_dop_imm_action[v][1]
    end
  end

  --final doppletime edits
  if #dop_imm_action > 4 then
    role_list[5][2] = role_list[2][2] + dop_imm_action[1][1] + dop_imm_action[2][1] + dop_imm_action[3][1]
  elseif #dop_imm_action == 4 then
    role_list[5][2] = role_list[3][2] + dop_imm_action[1][1] + dop_imm_action[3][1]
  end

  local j = 1
  for i,v in ipairs(color_list) do
    if Player[v].seated and player_list[v] ~= nil then
      gameData[v][1] = true
      gameData[v][7] = Player[v].steam_name
      gameData[v][8] = player_list[v]
      numplayers = numplayers + 1
      local d = {Player[v].steam_name, Player[v].color}
      table.insert(playerc_list, j, d)
      j = j+1
    else
      gameData[Player[v].color][1] = false
      gameData[v][8] = player_list[v] --for debugging
    end
  end

  --randomizeplayerNum()

	villains_inplay = {
	{'Temptress',false},
	{'Dr. Peeker',false},
	{'Rapscallion',false},
	{'Henchman #7',false},
	}

  --code for weird Mystic Wolf+Dream Wolf considerations
  mw_inplay = false
  othervp_inplay = false
  ww_for_option = true
  vp_for_option = true

  for i,v in pairs(play_list) do
    ----print("play list i,v : ",i,v)

    if i == 'Mystic Wolf' then
      mw_inplay = true
    end
    if i == 'The Master' or i == 'The Count' then
      othervp_inplay = true
    end
    if i == 'Cupid' then
      play_list['Lovers'] = 'on'
    end
	if i == 'Groob' or i == 'Zerb' then
      play_list['Groob and Zerb'] = 'on'
    end
    if i == 'Vampire' or i == 'The Count' or i == 'Renfield' or i == 'Diseased' or i == 'Cupid' or i == 'Instigator' or i == 'Priest' or i == 'Assassin' or i == 'Apprentice Assassin' or i == 'The Master' then
      play_list['Intermission'] = 'on'
	end

	if i == 'Alien' or i == 'Synthetic Alien' or i == 'Groob' or i == 'Zerb' or i == 'Body Snatcher'  then
      onua = true
      play_list['Alien'] = 'on'
	elseif i == 'Rascal' or i == 'Psychic' or i == 'Empath' then
	  onua = true
	end

	if i == 'Temptress' or i =='Dr. Peeker' or i == 'Rapscallion' or i=='Henchman #7' then
	  play_list['Villains'] = 'on'
	  if i == 'Temptress' then
	    villains_inplay[1][2] = true
		role_list[21][3] = role_list[21][3] .. "\n" .. "Temptress, you MUST give the additional villain card to any player who isn't a villain."
	  elseif i == 'Dr. Peeker' then
		villains_inplay[2][2] = true
		role_list[21][3] = role_list[21][3] .. "\n" .. "Dr. Peeker, you MAY look at one other player's card."
	  elseif i == 'Rapscallion' then
	    villains_inplay[3][2] = true
		role_list[21][3] = role_list[21][3] .. "\n" .. "Rapscallion, you MAY look at one of the center cards."
	  elseif i == 'Henchman #7' then
	  	villains_inplay[4][2] = true
	  end
	end
  end

  	for k,w in pairs (init_addition_villain_time) do
		----print(k..", "..w[1]..", "..w[2])
		for i,v in pairs(play_list) do
			if i == k then
				----print("did i make it?")
				local tmp_insert = init_addition_villain_time[i]
				table.insert(addition_villain_time, villainIter, tmp_insert)
				villainIter = villainIter + 1
				role_list[21][2] = role_list[21][2] + init_addition_villain_time[i][1]
			end
		end
	end

  --remove extra sentinel
  if play_list['Intermission'] ~= nil then
    if role_list[1][1] == 'Sentinel' then
      table.remove(role_list,1)
    end
    onuv = true
    getMarksUsedInGame()
  else
    if role_list[17][1] == 'Sentinel' then
      table.remove(role_list,17)
    end
    onuv = false
  end
  
  init_role_list = {}
  for i=1,#role_list do
    table.insert(init_role_list, i, {role_list[i][1],role_list[i][2],role_list[i][3],role_list[i][4]})	
  end
  
  --if there are no normal werewolves in play but a mystic wolf is in play, add the werewolf phase to the play_list
  if play_list['Werewolf'] == nil and mw_inplay == true then
    ww_for_option = false
    play_list['Werewolf'] = 'on'
  end



  if play_list['Vampire'] == nil and othervp_inplay == true then
    vp_for_option = false
    play_list['Vampire'] = 'on'
  end

  local k = 2
  for i,v in ipairs(playerc_list) do
    if k > numplayers then
      gameData[playerc_list[i][2]][10] = playerc_list[1][2]
    else
      gameData[playerc_list[i][2]][10] = playerc_list[k][2]
    end
    k = k + 1
  end

  bg_speaker.AssetBundle.playLoopingEffect(1)
  if (play_list['Vampire'] ~= nil and (play_list['Werewolf'] ~= nil or play_list['Villains'] ~= nil or play_list['Alien'] ~= nil)) or (play_list['Werewolf'] ~= nil and (play_list['Vampire'] ~= nil or play_list['Villains'] ~= nil or play_list['Alien'] ~= nil)) or (play_list['Villains'] ~= nil and (play_list['Vampire'] ~= nil or play_list['Alien'] ~= nil or play_list['Werewolf'] ~= nil)) or (play_list['Alien'] ~= nil and (play_list['Vampire'] ~= nil or play_list['Werewolf'] ~= nil or play_list['Villains'] ~= nil)) then
    bit_speaker.AssetBundle.playTriggerEffect(86)
    epic_battle = true
    printToAll("Prepare for an Epic Battle...", {1,1,0})
    Wait.time(nightPhase,5.885)
  else
    bit_speaker.AssetBundle.playTriggerEffect(0)
    Wait.time(nightPhase,3.717)
  end
  if onua == true then
	randomizeplayerNum()
  end
  doppleSet()
  settingNotes()
end

function doppleSet()
  after = {'Insomniac','Curator','Revealer','The Count','Renfield','Priest','Assassin','Apprentice Assassin','Marksman','Pickpocket','Gremlin','Apprentice Tanner','Beholder','Squire','Aura Seer','Intern','Self-Awareness Girl','Flipper','Leader','Psychic','Rascal','Exposer','Mortician','Body Snatcher','Nostradamus','Empath'}
  dop = {}

  if play_list['Doppelganger'] ~= nil then
    j = 1
    for i=1, #after do
      if play_list[after[i]] ~= nil then
        table.insert(dop, j, after[i])
      end
    end
    dopAnnouncement(dop)
  end
end

function dopAnnouncement(roles)
	for i,v in pairs(roles) do
		for j,w in ipairs(role_list) do
			if v == w[1] then
				play_list['Dopple-' .. v ..''] = 'on'
				if v == 'Insomniac' then
					d = {'Dopple-' .. v ..'' , 6.269, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Revealer' then
					d = {'Dopple-' .. v ..'' , 12.983, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Curator' then
					d = {'Dopple-' .. v ..'' , 11.651, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Apprentice Assassin' then
					d = {'Dopple-' .. v ..'' , 12.069, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Apprentice Tanner' then
					d = {'Dopple-' .. v ..'' , 6.4, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Assassin' then
					d = {'Dopple-' .. v ..'' , 7.967, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Aura Seer' then
					d = {'Dopple-' .. v ..'' , 11.729, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'The Count' then
					d = {'Dopple-' .. v ..'' , 8.411, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Gremlin' then
					d = {'Dopple-' .. v ..'' , 9.143, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Marksman' then
					d = {'Dopple-' .. v ..'' , 8.255, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Pickpocket' then
					d = {'Dopple-' .. v ..'' , 9.744, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Priest' then
					d = {'Dopple-' .. v ..'' , 7.576, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Renfield' then
					d = {'Dopple-' .. v ..'' , 6.504, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Squire' then
					d = {'Dopple-' .. v ..'' , 9.456, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Beholder' then
					d = {'Dopple-' .. v ..'' , 11.285, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
	--anythign below this line needs to be adjusted
				elseif v == 'Intern' then
					d = {'Dopple-' .. v ..'' , 11.285, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Self-Awareness Girl' then
					d = {'Dopple-' .. v ..'' , 11.285, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
				elseif v == 'Flipper' then
					d = {'Dopple-' .. v ..'' , 11.285, "Doppelganger! If you saw the " .. v .. " then do your action now.",2.560}
	---these should be on the right path now
				elseif v == 'Leader' then
					d = {'Dopple-' .. v ..'' , 7.967, "Doppelganger! If you saw the " .. v .. ", wake up. You will be shown who the Aliens are (Groob and Zerb will have a blue background), if there are any. If you see Groob and Zerb, you will only win if both of them remain alive.",2.560}
				elseif v == 'Psychic' then
					d = {'Dopple-' .. v ..'' , 4.023, "Doppelganger! If you saw the " .. v .. ", wake up.",2.560}
				elseif v == 'Rascal' then
					d = {'Dopple-' .. v ..'' , 4.284, "Doppelganger! If you saw the " .. v .. ", wake up.",2.560}
				elseif v == 'Exposer' then
					d = {'Dopple-' .. v ..'' , 4.493, "Doppelganger! If you saw the " .. v .. ", wake up.",2.560}
				elseif v == 'Mortician' then
					d = {'Dopple-' .. v ..'' , 4.101, "Doppelganger! If you saw the " .. v .. ", wake up.",2.560}
				elseif v == 'Empath' then
					d = {'Dopple-' .. v ..'' , 5.355, "Doppelganger! If you saw the " .. v .. ", wake up.",2.560}
				elseif v == 'Body Snatcher' then
					d = {'Dopple-' .. v ..'' , 6.191, "Doppelganger! If you saw the " .. v .. ", wake up. ",2.560}
				elseif v == 'Nostradamus' then
					d = {'Dopple-' .. v ..'' , 14.002, "Doppelganger! If you saw " .. v .. ", wake up. You MAY look at up to three cards. If you see any card that isn't on the villager team, stop. The last card you look at is the team you are on.",2.560}
				end
				table.insert(role_list, j+1, d)
			end
		end
	end
end

function nightPhase()
  Global.setDecals({})
  if phase == #role_list then
    --night phase ending
    UI.setAttribute("cancelGame","active","false")
    printToAll("Everyone! Wake up.", {1,1,0})
    bg_speaker.AssetBundle.playLoopingEffect(0)
    bit_speaker.AssetBundle.playTriggerEffect(21)
    night_phase = false
    phase_name = ''
    wakePlayers()
    checkTokens()
    showUI()
    countdown.call('onCall', timerset)
  elseif night_phase then
    ----print("Phase: ",phase_name)
    phase = phase + 1 --moves to the next phase
    r = role_list[phase]
    phase_name = r[1]


    if play_list[phase_name] ~= nil then


      if phase_name == 'Sentinel' then
        bit_speaker.AssetBundle.playTriggerEffect(53)
      elseif phase_name == 'Doppelganger' then
        bit_speaker.AssetBundle.playTriggerEffect(1)
        ----print("dop items: ",#dop_imm_action)
        local var_waittime = 7.158
        if #dop_imm_action == 4 then
          ----print('i am here')
          waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[1][2]),var_waittime)
          table.insert(wait_ids, waitid)
          var_waittime = var_waittime + dop_imm_action[1][1]
          waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[4][2]),var_waittime)
          table.insert(wait_ids, waitid)
          var_waittime = var_waittime + dop_imm_action[4][1]
          waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[3][2]),var_waittime)
          table.insert(wait_ids, waitid)
          var_waittime = var_waittime + dop_imm_action[3][1]
        elseif #dop_imm_action > 4 then
          waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[1][2]),var_waittime)
          table.insert(wait_ids, waitid)
          for i=4, #dop_imm_action do
            ----print(i)
            if i == 4 then
              var_waittime = var_waittime + dop_imm_action[1][1]
              waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[i][2]),var_waittime)
              table.insert(wait_ids, waitid)
            elseif i == #dop_imm_action then
              var_waittime = var_waittime + dop_imm_action[i-1][1]
              waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[2][2]),var_waittime)
              table.insert(wait_ids, waitid)
              var_waittime = var_waittime + dop_imm_action[2][1]
              waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[i][2]),var_waittime)
              table.insert(wait_ids, waitid)
              var_waittime = var_waittime + dop_imm_action[i][1]
              waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[3][2]),var_waittime)
              table.insert(wait_ids, waitid)
              var_waittime = var_waittime + dop_imm_action[3][1]
            else
              var_waittime = var_waittime + dop_imm_action[i-1][1]
              waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(dop_imm_action[i][2]),var_waittime)
              table.insert(wait_ids, waitid)
            end
          end

        else
          --do nothing
        end
        if min_inplay then
          waitid = Wait.time(|| bit_speaker.AssetBundle.playTriggerEffect(2),var_waittime)
          table.insert(wait_ids, waitid)
        end
      elseif phase_name == 'Villains' then
        evilometermsg()
        villainsText()
        bit_speaker2.AssetBundle.playTriggerEffect(37)
        ----print(#addition_villain_time)
        if #addition_villain_time == 0 then
          --do nothing
        else
          local var_waittime = 9.535
          for i=1, #addition_villain_time do
            if i ==1 then
              waitid = Wait.time(|| bit_speaker2.AssetBundle.playTriggerEffect(addition_villain_time[i][2]),var_waittime)
              table.insert(wait_ids, waitid)
            else
              var_waittime = var_waittime + addition_villain_time[i-1][1]
              waitid = Wait.time(|| bit_speaker2.AssetBundle.playTriggerEffect(addition_villain_time[i][2]),var_waittime)
              table.insert(wait_ids, waitid)
            end
          end
        end
      elseif phase_name == 'Werewolf' then
        ----print(dw_inplay)
        if dw_inplay then
          bit_speaker.AssetBundle.playTriggerEffect(59)
        else
          bit_speaker.AssetBundle.playTriggerEffect(3)
        end
        minionText()
      elseif phase_name == 'Alpha Wolf' then
        bit_speaker.AssetBundle.playTriggerEffect(28)
      elseif phase_name == 'Mystic Wolf' then
        bit_speaker.AssetBundle.playTriggerEffect(48)
      elseif phase_name == 'Minion' then
        bit_speaker.AssetBundle.playTriggerEffect(5)
        minionText()
      elseif phase_name == 'Dopple-Insomniac' then
        bit_speaker.AssetBundle.playTriggerEffect(19)
      elseif phase_name == 'Dopple-Curator' then
        bit_speaker.AssetBundle.playTriggerEffect(32)
      elseif phase_name == 'Dopple-Revealer' then
        bit_speaker.AssetBundle.playTriggerEffect(46)
      elseif phase_name == 'Mason' then
        bit_speaker.AssetBundle.playTriggerEffect(7)
        masonText()
      elseif phase_name == 'Seer' then
        bit_speaker.AssetBundle.playTriggerEffect(9)
      elseif phase_name == 'Apprentice Seer' then
        bit_speaker.AssetBundle.playTriggerEffect(26)
      elseif phase_name == 'Paranormal Investigator' then
        bit_speaker.AssetBundle.playTriggerEffect(50)
      elseif phase_name == 'Robber' then
        bit_speaker.AssetBundle.playTriggerEffect(11)
      elseif phase_name == 'Witch' then
        bit_speaker.AssetBundle.playTriggerEffect(58)
      elseif phase_name == 'Troublemaker' then
        bit_speaker.AssetBundle.playTriggerEffect(13)
      elseif phase_name == 'Village Idiot' then
        bit_speaker.AssetBundle.playTriggerEffect(56)
      elseif phase_name == 'Aura Seer' then
        bit_speaker.AssetBundle.playTriggerEffect(67)
        auraText()
      elseif phase_name == 'Drunk' then
        bit_speaker.AssetBundle.playTriggerEffect(15)
      elseif phase_name == 'Insomniac' then
        bit_speaker.AssetBundle.playTriggerEffect(17)
      elseif phase_name == 'Revealer' then
        bit_speaker.AssetBundle.playTriggerEffect(52)
      elseif phase_name == 'Curator' then
        bit_speaker.AssetBundle.playTriggerEffect(31)
      elseif phase_name == 'Copycat' then
        bit_speaker.AssetBundle.playTriggerEffect(69)
      elseif phase_name == 'Vampire' then
        renfieldText()
        bit_speaker2.AssetBundle.playTriggerEffect(6)
      elseif phase_name == 'The Count' then
        bit_speaker2.AssetBundle.playTriggerEffect(8)
      elseif phase_name == 'Renfield' then
        renfieldText()
        bit_speaker2.AssetBundle.playTriggerEffect(2)
      elseif phase_name == 'Diseased' then
        bit_speaker.AssetBundle.playTriggerEffect(71)
      elseif phase_name == 'Cupid' then
        bit_speaker2.AssetBundle.playTriggerEffect(10)
      elseif phase_name == 'Instigator' then
        bit_speaker.AssetBundle.playTriggerEffect(91)
      elseif phase_name == 'Priest' then
        bit_speaker2.AssetBundle.playTriggerEffect(0)
      elseif phase_name == 'Assassin' then
        bit_speaker.AssetBundle.playTriggerEffect(65)
      elseif phase_name == 'Apprentice Assassin' then
        bit_speaker.AssetBundle.playTriggerEffect(61)
        appAssassinText()
      elseif phase_name == 'Marksman' then
        bit_speaker.AssetBundle.playTriggerEffect(95)
      elseif phase_name == 'Pickpocket' then
        bit_speaker.AssetBundle.playTriggerEffect(97)
      elseif phase_name == 'Gremlin' then
        bit_speaker.AssetBundle.playTriggerEffect(89)
      elseif phase_name == 'Lovers' then
        bit_speaker.AssetBundle.playTriggerEffect(93)
        loveText()
      elseif phase_name == 'Dopple-Apprentice Assassin' then
        appAssassinText()
        bit_speaker.AssetBundle.playTriggerEffect(72)
      elseif phase_name == 'Dopple-Apprentice Tanner' then
        bit_speaker.AssetBundle.playTriggerEffect(73)
        tannerText()
      elseif phase_name == 'Dopple-Assassin' then
        bit_speaker.AssetBundle.playTriggerEffect(74)
      elseif phase_name == 'Dopple-Aura Seer' then
        bit_speaker.AssetBundle.playTriggerEffect(75)
        auraText()
      elseif phase_name == 'Dopple-The Count' then
        bit_speaker.AssetBundle.playTriggerEffect(76)
      elseif phase_name == 'Dopple-Gremlin' then
        bit_speaker.AssetBundle.playTriggerEffect(77)
      elseif phase_name == 'Dopple-Marksman' then
        bit_speaker.AssetBundle.playTriggerEffect(78)
      elseif phase_name == 'Dopple-Pickpocket' then
        bit_speaker.AssetBundle.playTriggerEffect(79)
      elseif phase_name == 'Dopple-Priest' then
        bit_speaker.AssetBundle.playTriggerEffect(80)
      elseif phase_name == 'Dopple-Renfield' then
        bit_speaker.AssetBundle.playTriggerEffect(81)
        renfieldText()
      elseif phase_name == 'Thing' then
        bit_speaker2.AssetBundle.playTriggerEffect(4)
      elseif phase_name == 'Beholder' then
        bit_speaker2.AssetBundle.playTriggerEffect(14)
        beholderText()
      elseif phase_name == 'Squire' then
        bit_speaker2.AssetBundle.playTriggerEffect(11)
        minionText()
      elseif phase_name == 'Dopple-Beholder' then
        bit_speaker2.AssetBundle.playTriggerEffect(16)
        beholderText()
      elseif phase_name == 'Dopple-Squire' then
        bit_speaker2.AssetBundle.playTriggerEffect(13)
        minionText()
      elseif phase_name == 'Apprentice Tanner' then
        bit_speaker.AssetBundle.playTriggerEffect(63)
        tannerText()
      elseif phase_name == 'Annoying Lad' then
        bit_speaker2.AssetBundle.playTriggerEffect(18)
      elseif phase_name == 'Detector' then
        bit_speaker2.AssetBundle.playTriggerEffect(20)
      elseif phase_name == 'Flipper' then
        bit_speaker2.AssetBundle.playTriggerEffect(23)
      elseif phase_name == 'Intern' then
        bit_speaker2.AssetBundle.playTriggerEffect(25)
        internText()
      elseif phase_name == 'Mirror Man' then
        bit_speaker2.AssetBundle.playTriggerEffect(27)
      elseif phase_name == 'Role Retriever' then
        bit_speaker2.AssetBundle.playTriggerEffect(30)
      elseif phase_name == 'Self-Awareness Girl' then
        bit_speaker2.AssetBundle.playTriggerEffect(32)
      elseif phase_name == 'Switcheroo' then
        bit_speaker2.AssetBundle.playTriggerEffect(34)
      elseif phase_name == 'Voodoo Lou' then
        bit_speaker2.AssetBundle.playTriggerEffect(39)
      elseif phase_name == 'Alien' then
        bit_speaker3.AssetBundle.playTriggerEffect(10)
        alienText()
        alienRandomization()
        for i=1, #alienPlayOrder do
          if i == 1 then
            variablewait = 4.075
          else
            variablewait = variablewait + alienPlayOrder[i-1][1]
          end
          audiofixforaliens(alienPlayOrder[i][2],variablewait)
        end
	    	play_list['Ripple']='on'
        cowmsg()
      elseif phase_name == 'Oracle' then
        bit_speaker3.AssetBundle.playTriggerEffect(90)
        oracleRandomization()
        waitid = Wait.time(||bit_speaker3.AssetBundle.playTriggerEffect(oracleN),4.127)
		
      elseif phase_name == 'Groob and Zerb' then
        bit_speaker3.AssetBundle.playTriggerEffect(46)
        alienText()
      elseif phase_name == 'Leader' then
        bit_speaker3.AssetBundle.playTriggerEffect(49)
        alienText()
	  elseif phase_name == 'Dopple-Leader' then
		bit_speaker4.AssetBundle.playTriggerEffect(74)
        alienText()
      elseif phase_name == 'Psychic' then
        bit_speaker4.AssetBundle.playTriggerEffect(17)
        psychicRandomization()
        for i=1, #psyPlayOrder do
          if i == 1 then
            variablewait = 1.672
          else
            variablewait = variablewait + psyPlayOrder[i-1][1]
          end
          audiofixforaliens(psyPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Dopple-Psychic' then
		bit_speaker4.AssetBundle.playTriggerEffect(77)
        psychicRandomization()
        for i=1, #psyPlayOrder do
          if i == 1 then
            variablewait = 4.023
          else
            variablewait = variablewait + psyPlayOrder[i-1][1]
          end
          audiofixforaliens(psyPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Exposer' then
        bit_speaker3.AssetBundle.playTriggerEffect(44)
        exposerRandomization()
        waitid = Wait.time(|| bit_speaker3.AssetBundle.playTriggerEffect(exposerN),2.064)
        table.insert(wait_ids, waitid)
	  elseif phase_name == 'Dopple-Exposer' then
		bit_speaker4.AssetBundle.playTriggerEffect(73)
        exposerRandomization()
        waitid = Wait.time(|| bit_speaker3.AssetBundle.playTriggerEffect(exposerN),4.493)
        table.insert(wait_ids, waitid)
      elseif phase_name == 'Blob' then
        bit_speaker3.AssetBundle.playTriggerEffect(23)
        blobRandomization()
        for i=1, #blobPlayOrder do
          if i == 1 then
            variablewait = 0.653
          else
            variablewait = variablewait + blobPlayOrder[i-1][1]
          end
          audiofixforaliens(blobPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Mortician' then
        bit_speaker3.AssetBundle.playTriggerEffect(54)
        morticianRandomization()
        for i=1, #mortPlayOrder do
          if i == 1 then
            variablewait = 1.698
          else
            variablewait = variablewait + mortPlayOrder[i-1][1]
          end
          audiofixforaliens(mortPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Dopple-Mortician' then
        bit_speaker4.AssetBundle.playTriggerEffect(75)
        morticianRandomization()
        for i=1, #mortPlayOrder do
          if i == 1 then
            variablewait = 4.101
          else
            variablewait = variablewait + mortPlayOrder[i-1][1]
          end
          audiofixforaliens(mortPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Empath' then
        bit_speaker3.AssetBundle.playTriggerEffect(37)
        empathRandomization()
        empathUI()
        for i=1, #empPlayOrder do
          if i == 1 then
            variablewait = 1.798
          else
            variablewait = variablewait + empPlayOrder[i-1][1]
          end
          audiofixforaliens(empPlayOrder[i][2],variablewait)
        end
	  elseif phase_name == 'Dopple-Empath' then
		bit_speaker4.AssetBundle.playTriggerEffect(72)
        empathRandomization()
        empathUI()
        for i=1, #empPlayOrder do
          if i == 1 then
            variablewait = 5.355
          else
            variablewait = variablewait + empPlayOrder[i-1][1]
          end
          audiofixforaliens(empPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Body Snatcher' then
        bit_speaker3.AssetBundle.playTriggerEffect(29)
        bodySnatcherRandomization()
        for i=1, #bodySnatchPlayOrder do
          if i == 1 then
            variablewait = 2.847
          else
            variablewait = variablewait + bodySnatchPlayOrder[i-1][1]
          end
          audiofixforaliens(bodySnatchPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Dopple-Body Snatcher' then
		bit_speaker4.AssetBundle.playTriggerEffect(70)
        bodySnatcherRandomization()
        for i=1, #bodySnatchPlayOrder do
          if i == 1 then
            variablewait = 6.191
          else
            variablewait = variablewait + bodySnatchPlayOrder[i-1][1]
          end
          audiofixforaliens(bodySnatchPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Rascal' then
        bit_speaker4.AssetBundle.playTriggerEffect(27)
        rascalRandomization()
        for i=1, #rascPlayOrder do
          if i == 1 then
            variablewait = 1.776
          else
            variablewait = variablewait + rascPlayOrder[i-1][1]
          end
          audiofixforaliens(rascPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Dopple-Rascal' then
		bit_speaker4.AssetBundle.playTriggerEffect(71)
        rascalRandomization()
        for i=1, #rascPlayOrder do
          if i == 1 then
            variablewait = 4.284
          else
            variablewait = variablewait + rascPlayOrder[i-1][1]
          end
          audiofixforaliens(rascPlayOrder[i][2],variablewait)
        end
      elseif phase_name == 'Nostradamus' then
        bit_speaker4.AssetBundle.playTriggerEffect(60)
	  elseif phase_name == 'Dopple-Nostradamus' then
		bit_speaker4.AssetBundle.playTriggerEffect(76)
      elseif phase_name == 'Family Man' then
        familymanRandomization()
        bit_speaker2.AssetBundle.playTriggerEffect(47)
        for i=1, #famPlayOrder do
          if i == 1 then
            variablewait = 2.59
          else
            variablewait = variablewait + famPlayOrder[i-1][1]
          end
          waitid = Wait.time(|| bit_speaker2.AssetBundle.playTriggerEffect(famPlayOrder[i][2]),variablewait)
          table.insert(wait_ids, waitid)
        end
      elseif phase_name == 'Ripple' and play_list['Alien'] ~= nil then
	      rippleRandomization()
        for i=1, #ripplePlayOrder do
          if i == 1 then
            variablewait = 0
          else
            variablewait = variablewait + ripplePlayOrder[i-1][1]
          end
          audiofixforaliens(ripplePlayOrder[i][2],variablewait)
        end
      end

      new_r = role_list[phase]
      printToAll(' ', {0,0,0})
      printToAll(' ', {0,0,0})
      printToAll(new_r[3], {1,1,0})
	  
	  if phase_name == 'Intermission' then
        --bit_speaker.AssetBundle.playTriggerEffect(87)
        printMarks()
	  end
	  
	  
      wakePlayers()

	
      if new_r[1] == 'Intermission' or new_r[1] == 'Ripple' or new_r[1] == 'Family Man' or new_r[1] == 'Blob' then
        timeleft = new_r[2]
      elseif new_r[1] == 'Doppelganger' then
        timeleft = new_r[2] + timeperturn + 5
      else
        timeleft = new_r[2] + timeperturn
      end

      timeRefresh(timeleft)
      if phase_name == 'Ripple' then
        if ripplerepeat == true or ripplerepeatonep == true then
          resetToStartingRoles()
        end
      end

      if phase_name == 'Intermission' or phase_name == 'Ripple' or phase_name == 'Family Man' or phase_name == 'Blob' then
        waitid = Wait.time(endPhase,new_r[2])
        table.insert(wait_ids, waitid)
        waitid = Wait.time(nightPhase,new_r[2] + 1)
        table.insert(wait_ids, waitid)
      elseif new_r[1] == 'Doppelganger' then
	    	waitid = Wait.time(endPhase,new_r[2] + timeperturn + 5)
        table.insert(wait_ids, waitid)
        waitid = Wait.time(nightPhase,new_r[2] + timeperturn + 5 + new_r[4] + 1)
        table.insert(wait_ids, waitid)
      else
        waitid = Wait.time(endPhase,new_r[2] + timeperturn)
        table.insert(wait_ids, waitid)
        waitid = Wait.time(nightPhase,new_r[2] + timeperturn + new_r[4] + 1)
        table.insert(wait_ids, waitid)
      end
    else
      nightPhase()
    end
  end
end

function settingNotes()
  night_roles = {}
  note_string = '[b]Night order:[/b]'
  for i,v in ipairs(role_list) do
    if v[1] == 'Intermission' or v[1] == 'Ripple' then
      --skip!
    elseif play_list[v[1]] ~= nil then
      note_string = note_string .. '\n' .. v[1]
	  table.insert(night_roles,v[1])
    end
  end
  note_string = note_string .. '\n' .. '\n' .. '[b]  Other roles:[/b]' .. '\n'
  comma = ''
  for i,v in ipairs(no_night_list) do
    if play_list[v[1]] ~= nil then
      note_string = note_string .. comma .. v[1]
      comma = ', '
    end
  end
  setNotes(note_string)
end

--[[this phase puts blindfolds back on and plays end phase audio]]
function endPhase()
  Global.setDecals({})
  for i,c in ipairs(color_list) do

    if player_list[c] ~= nil then

      if OchosenOne[c] ~= nil then
		--skip
	  elseif RchosenOne[c] ~= nil then
		--skip
	  elseif player_list[c] == phase_name then
        Player[c].blindfolded = true
	  elseif phase_name == 'Paranormal Investigator' then
	    Player[play_list['Paranormal Investigator']].blindfolded = true
      elseif phase_name == 'Doppelganger' then

        if string.find(player_list[c], 'Dopple') then
          Player[c].blindfolded = true
        end
      elseif phase_name == 'Werewolf' then
        if player_list[c] == 'Dopple-Werewolf' or player_list[c] == 'Dopple-Alpha Wolf' or player_list[c] == 'Dopple-Mystic Wolf' or player_list[c] == 'Alpha Wolf' or player_list[c] == 'Mystic Wolf' then
          Player[c].blindfolded = true
        end
      elseif phase_name == 'Mason' then
        if player_list[c] == 'Dopple-Mason' then
          Player[c].blindfolded = true
        end
      elseif phase_name == 'Vampire' then
        if player_list[c] == 'Dopple-Vampire' or player_list[c] == 'Dopple-The Count' or player_list[c] == 'The Count' or player_list[c] == 'The Master' or player_list[c] == 'Mystic Wolf' then
          Player[c].blindfolded = true
        end
	  elseif phase_name == 'Villains' then
		if player_list[c] == 'Temptress' or player_list[c] == 'Dr. Peeker' or player_list[c] == 'Rapscallion' or player_list[c] == 'Henchman #7' or player_list[c] == 'Dopple-Temptress' or player_list[c] == 'Dopple-Dr. Peeker' or player_list[c] == 'Dopple-Rapscallion' or player_list[c] == 'Dopple-Henchman #7'  then
			Player[c].blindfolded = true
		end
      elseif phase_name == 'Copycat' and c == cat_color then
        Player[c].blindfolded = true
	  elseif phase_name == 'Mirror Man' and c == mirror_color then
        Player[c].blindfolded = true
	  elseif phase_name == 'Groob and Zerb' then
		if player_list[c] == 'Groob' or player_list[c] == 'Zerb' or player_list[c] == 'Dopple-Groob' or player_list[c] == 'Dopple-Zerb'  then
			Player[c].blindfolded = true
		end
	  elseif phase_name == 'Alien' then
		if (player_list[c] == 'Alien' or player_list[c] == 'Synthetic Alien' or  player_list[c] == 'Groob' or player_list[c] == 'Zerb' or player_list[c] == 'Body Snatcher' or player_list[c] == 'Dopple-Alien' or player_list[c] == 'Dopple-Synthetic Alien' or  player_list[c] == 'Dopple-Groob' or player_list[c] == 'Dopple-Zerb' or player_list[c] == 'Dopple-Body Snatcher') then
			Player[c].blindfolded = true
		end
	  elseif phase_name == 'Body Snatcher' and c == bodysnatch_color then
	    init_bodysnatch = init_bodysnatch + 1
		  Player[c].blindfolded = true
    elseif phase_name == 'Dopple-Body Snatcher' and c == dop_bodysnatch_color then
      init_dopbodysnatch = init_dopbodysnatch + 1
     Player[c].blindfolded = true
    elseif phase_name == 'Lovers' and (gameData[c][18] == '305c28' or gameData[c][18] == '6bcd9d'  or gameData[c][18] == 'ae80db'  or gameData[c][18] == 'f4902d')  then
      Player[c].blindfolded = true
    end

    end
  end

    if phase_name == 'Doppelganger' then
      bit_speaker.AssetBundle.playTriggerEffect(20)
    elseif phase_name == 'Werewolf' then
      bit_speaker.AssetBundle.playTriggerEffect(4)
    elseif phase_name == 'Minion' then
      bit_speaker.AssetBundle.playTriggerEffect(6)
    elseif phase_name == 'Mason' then
      bit_speaker.AssetBundle.playTriggerEffect(8)
    elseif phase_name == 'Seer' then
      bit_speaker.AssetBundle.playTriggerEffect(10)
    elseif phase_name == 'Robber' then
      bit_speaker.AssetBundle.playTriggerEffect(12)
    elseif phase_name == 'Troublemaker' then
      bit_speaker.AssetBundle.playTriggerEffect(14)
    elseif phase_name == 'Drunk' then
      bit_speaker.AssetBundle.playTriggerEffect(16)
    elseif phase_name == 'Sentinel' then
      bit_speaker.AssetBundle.playTriggerEffect(54)
    elseif phase_name == 'Alpha Wolf' then
      bit_speaker.AssetBundle.playTriggerEffect(29)
    elseif phase_name == 'Mystic Wolf' then
      bit_speaker.AssetBundle.playTriggerEffect(47)
    elseif phase_name == 'Apprentice Seer' then
      bit_speaker.AssetBundle.playTriggerEffect(27)
    elseif phase_name == 'Paranormal Investigator' then
      bit_speaker.AssetBundle.playTriggerEffect(49)
    elseif phase_name == 'Witch' then
      bit_speaker.AssetBundle.playTriggerEffect(57)
    elseif phase_name == 'Village Idiot' then
      bit_speaker.AssetBundle.playTriggerEffect(55)
    elseif phase_name == 'Revealer' then
      bit_speaker.AssetBundle.playTriggerEffect(51)
    elseif phase_name == 'Curator' then
      bit_speaker.AssetBundle.playTriggerEffect(30)
    elseif phase_name == 'Apprentice Assassin' then
      bit_speaker.AssetBundle.playTriggerEffect(60)
    elseif phase_name == 'Apprentice Tanner' then
      bit_speaker.AssetBundle.playTriggerEffect(62)
    elseif phase_name == 'Assassin' then
      bit_speaker.AssetBundle.playTriggerEffect(64)
    elseif phase_name == 'Aura Seer' then
      bit_speaker.AssetBundle.playTriggerEffect(66)
    elseif phase_name == 'Copycat' then
      bit_speaker.AssetBundle.playTriggerEffect(68)
    elseif phase_name == 'Diseased' then
      bit_speaker.AssetBundle.playTriggerEffect(70)
    elseif phase_name == 'Gremlin' then
      bit_speaker.AssetBundle.playTriggerEffect(88)
    elseif phase_name == 'Instigator' then
      bit_speaker.AssetBundle.playTriggerEffect(90)
    elseif phase_name == 'Lovers' then
      bit_speaker.AssetBundle.playTriggerEffect(92)
    elseif phase_name == 'Marksman' then
      bit_speaker.AssetBundle.playTriggerEffect(94)
    elseif phase_name == 'Pickpocket' then
      bit_speaker.AssetBundle.playTriggerEffect(96)
    elseif phase_name == 'Priest' then
      bit_speaker.AssetBundle.playTriggerEffect(98)
    elseif phase_name == 'Renfield' then
      bit_speaker2.AssetBundle.playTriggerEffect(1)
    elseif phase_name == 'Thing' then
      bit_speaker2.AssetBundle.playTriggerEffect(3)
    elseif phase_name == 'Vampire' then
      bit_speaker2.AssetBundle.playTriggerEffect(5)
    elseif phase_name == 'The Count' then
      bit_speaker2.AssetBundle.playTriggerEffect(7)
    elseif phase_name == 'Cupid' then
      bit_speaker2.AssetBundle.playTriggerEffect(9)
    elseif phase_name == 'Squire' then
      bit_speaker2.AssetBundle.playTriggerEffect(12)
    elseif phase_name == 'Beholder' then
      bit_speaker2.AssetBundle.playTriggerEffect(15)
	elseif phase_name == 'Annoying Lad' then
      bit_speaker2.AssetBundle.playTriggerEffect(17)
	elseif phase_name == 'Detector' then
      bit_speaker2.AssetBundle.playTriggerEffect(19)
	elseif phase_name == 'Flipper' then
      bit_speaker2.AssetBundle.playTriggerEffect(22)
	elseif phase_name == 'Intern' then
      bit_speaker2.AssetBundle.playTriggerEffect(24)
	elseif phase_name == 'Mirror Man' then
      bit_speaker2.AssetBundle.playTriggerEffect(26)
	elseif phase_name == 'Role Retriever' then
      bit_speaker2.AssetBundle.playTriggerEffect(29)
	elseif phase_name == 'Self-Awareness Girl' then
      bit_speaker2.AssetBundle.playTriggerEffect(31)
	elseif phase_name == 'Switcheroo' then
      bit_speaker2.AssetBundle.playTriggerEffect(33)
	elseif phase_name == 'Voodoo Lou' then
      bit_speaker2.AssetBundle.playTriggerEffect(38)
	elseif phase_name == 'Insomniac' then
      bit_speaker.AssetBundle.playTriggerEffect(18)
	elseif phase_name == 'Villains' then
      bit_speaker2.AssetBundle.playTriggerEffect(36)
	elseif phase_name == 'Family Man' then
      bit_speaker2.AssetBundle.playTriggerEffect(46)
	elseif phase_name == 'Oracle' then
       bit_speaker3.AssetBundle.playTriggerEffect(59)
	elseif phase_name == 'Alien' then
      bit_speaker3.AssetBundle.playTriggerEffect(9)
	elseif phase_name == 'Groob and Zerb' then
      bit_speaker3.AssetBundle.playTriggerEffect(45)
	elseif phase_name == 'Body Snatcher' then
      bit_speaker3.AssetBundle.playTriggerEffect(28)
	elseif phase_name == 'Leader' then
      bit_speaker3.AssetBundle.playTriggerEffect(48)
	elseif phase_name == 'Nostradamus' then
      bit_speaker4.AssetBundle.playTriggerEffect(58)
	elseif phase_name == 'Psychic' then
      bit_speaker4.AssetBundle.playTriggerEffect(15)
	elseif phase_name == 'Rascal' then
      bit_speaker4.AssetBundle.playTriggerEffect(20)
	elseif phase_name == 'Exposer' then
      bit_speaker3.AssetBundle.playTriggerEffect(40)
	elseif phase_name == 'Empath' then
      bit_speaker3.AssetBundle.playTriggerEffect(31)
	  clearVectorPaint()
	elseif phase_name == 'Blob' then
      --insert closing audio
	elseif phase_name == 'Mortician' then
      bit_speaker3.AssetBundle.playTriggerEffect(52)
	elseif phase_name == 'Ripple' then
      --insert closing audio
    elseif string.find(phase_name, 'Dopple') then
      bit_speaker.AssetBundle.playTriggerEffect(20)
    end

  if phase_name == 'Revealer' or phase_name == 'Curator' or phase_name == 'Dopple-Revealer' or phase_name == 'Dopple-Curator' then
    --do nothing
  else
    --flipcardsfacedown()
  end
end

function flipcardsfacedown()

  for index,card in pairs(cards_used_in_game) do
    card_object = getObjectFromGUID(card)
    if card ~= nil then
      rot = card_object.getRotation()
      ----print(rot[1])
      card_object.setRotation({rot[1],rot[2],180})
    end

  end
end

function hideUI()
	UI.setXml("")
end

function showUI()
  xml = '<Panel offsetXY="70 -10" width ="200" height="30" rectAlignment="UpperLeft" visibility="White|Brown|Red|Orange|Yellow|Green|Teal|Blue|Purple|Pink"><Dropdown id="claim"  onValueChanged="claimSelected" height="30" width="200" rectAlignment="UpperLeft" childAlignment="MiddleCenter" spacing="5"><Option selected="true">No claim</Option>'

  for i,v in ipairs(role_list) do
    if play_list[v[1]] ~= nil then
      if string.find(v[1], 'Dopple') or v[1] == 'Intermission' or v[1] == 'Lovers' or v[1] == 'Ripple' then
        --do nothing
      elseif ww_for_option == false and v[1] == 'Werewolf' then
        --do nothing
      elseif vp_for_option == false and v[1] == 'Vampire' then
        --do nothing
	  elseif v[1] == 'Villains' then
		if villains_inplay[1][2] == true then
			xml = xml .. '<Option>' .. villains_inplay[1][1] ..'</Option>'
		end
		if villains_inplay[2][2] == true then
			xml = xml .. '<Option>' .. villains_inplay[2][1] ..'</Option>'
		end
		if villains_inplay[3][2] == true then
			xml = xml .. '<Option>' .. villains_inplay[3][1] ..'</Option>'
		end
		if villains_inplay[4][2] == true then
			xml = xml .. '<Option>' .. villains_inplay[4][1] ..'</Option>'
		end
	  elseif v[1] == 'Groob and Zerb' then
		if play_list['Groob'] ~= nil then
			xml = xml .. '<Option>Groob</Option>'
		end
		if play_list['Zerb'] ~= nil then
			xml = xml .. '<Option>Zerb</Option>'
		end
      else
        xml = xml .. '<Option>' .. v[1] ..'</Option>'
      end
    end
  end
  for i,v in ipairs(no_night_list) do
    if play_list[v[1]] ~= nil then
      xml = xml .. '<Option>' .. v[1] ..'</Option>'
    end
  end

  xml = xml .. '</Dropdown></Panel><Text color="White" offsetXY="0 -265" visibility="White|Brown|Red|Orange|Yellow|Green|Teal|Blue|Purple|Pink">Click on the buttons below to vote for who to kill, only your last vote will count:</Text>'

  for i in pairs(gameData) do
    if gameData[i][1] == true then
        xml = xml .. '<Text id="' .. i .. 'voteindicatorlabel" color="' .. i .. '" offsetXY="0 450" visibility="' .. i .. '">Your vote is set to:</Text><Text id="' .. i .. 'voteindicator" color="' .. gameData[i][10] .. '" offsetXY="0 428" visibility="' .. i .. '">'.. gameData[gameData[i][10]][7] ..'</Text>'

        xml = xml .. '<GridLayout id="vote" offsetXY="0 -825"  width="720" active="true" visibility="' .. i .. '"  cellSize="180 75">'
	  
	    --if center vote enabled
	    if centerVoteEnabled == true then
		  xml = xml .. '<Button id="Center" color="Black" onClick="vote"><text color="White">Center</text></Button>'
	    end

        for j in pairs(gameData) do
          if i == j then
            --do nothing
          elseif gameData[j][1] == true then
            xml = xml .. '<Button id="' .. j .. '" color="' .. j .. '"  onClick="vote"><text color="Black">' .. gameData[j][7] .. '</text></Button>'
          end
        end
	  

        xml = xml .. '</GridLayout>'
    end
  end

  UI.setXml(xml)
end

function vote(player, value, id)
  if id == "Center" then
    gameData[player.color][10] = id
    printToColor("You are voting for the Center.", player.color)
	local voteindicatorid = player.color .. 'voteindicator'
    UI.setAttribute(player.color .. 'voteindicator',"text","Center")
    UI.setAttribute(player.color .. 'voteindicator',"color","Black")
  else

    for i in pairs(gameData) do
      if player.color == i then
        gameData[player.color][10] = id

          printToColor("You are voting for: " .. id .. ", " .. gameData[id][7] .. ".", player.color)
 
		local voteindicatorid = player.color .. 'voteindicator'
        UI.setAttribute(player.color .. 'voteindicator',"text",gameData[id][7])
        UI.setAttribute(player.color .. 'voteindicator',"color",id)
      end
    end
  end
end

function tallyVote(a)
  centerVotes = 0
  noplayerwolves = true
  noplayermin = true
  noplayervamp = true
  noplayervilain = true
  noplayeralien = true
  protected = {}
  if onuv == true then
    for i,c in ipairs(color_list) do
      if Player[c].seated == true then
        markzone = getObjectFromGUID(gameData[c][17])
        mark = markzone.getObjects()
        g = mark[1].guid
        gameData[c][18] = g
      end
    end
  end

  for i,v in pairs(areas) do
    zone = getObjectFromGUID(v[1])
    cards = zone.getObjects()

    for o,c in ipairs(cards) do
      g = c.guid
      if token_list[g] ~= nil and not string.find(v[2], 'Center') then
        if g == 'bb0322' then
          gameData[v[2]][9] = 'Tanner'
        elseif g == 'd27947' then
          gameData[v[2]][9] = 'Villager'
        elseif g == 'd3c16a' then
          gameData[v[2]][9] = 'Werewolf'
        elseif g == '8a3677' then
          gameData[v[2]][9] = 'Prince'
        elseif g == '36c368' then
          gameData[v[2]][9] = 'Hunter'
        elseif g == '43052f' then
          gameData[v[2]][9] = 'Bodyguard'
        elseif g == '4cfdbe' then
          gameData[v[2]][9] = 'Vampire'
		elseif g == 'f6ccae' then
		  gameData[v[2]][9] = 'Alien'
        end
      elseif g_table[g] ~= nil and not string.find(v[2], 'Center') then
        if g_table[g][1] == "Doppelganger" and not (dopple_change == '') then

          if dopple_change == 'Paranormal Investigator' and not (dop_pi_change == '') then
            gameData[v[2]][9] = "Dopple-" .. dopple_change .. "-" .. dop_pi_change
          elseif dopple_change == 'Copycat' and not (cat_change == '') then
            gameData[v[2]][9] = "Dopple-" .. dopple_change .. "-" .. cat_change
		  elseif dopple_change == 'Mirror Man' and not (mirror_change == '') then
            gameData[v[2]][9] = "Dopple-" .. dopple_change .. "-" .. mirror_change
          else
            gameData[v[2]][9] = "Dopple-" .. dopple_change
          end

        elseif g_table[g][1] == "Paranormal Investigator" and not (pi_change == '') then
          gameData[v[2]][9] = "Paranormal Investigator-" .. pi_change

        elseif g_table[g][1] == "Copycat" and not (cat_change == '') then
          gameData[v[2]][9] = "Copycat-" .. cat_change
		  if cat_change == "Doppelganger" then
			gameData[v[2]][9] = "Copycat-" .. cat_change .. "-"..dopple_change
		  end
		elseif g_table[g][1] == "Mirror Man" and not (mirror_change == '') then
          gameData[v[2]][9] = "Mirror Man-" .. mirror_change
		  if mirror_change == "Doppelganger" then
			gameData[v[2]][9] = "Mirror Man-" .. mirror_change .. "-"..dopple_change
		  end
        else
          --player_list[v[2]] = g_table[g][1] --logs the role of each player
          gameData[v[2]][9] = g_table[g][1]
          ----print('gameData[v[2]][9] is: ',gameData[v[2]][9])
        end
      end

    end
  end

  --figure out if there are no player werewolves/minions
  for i in pairs(gameData) do
    if string.find(gameData[i][9], 'wolf') or string.find(gameData[i][10], 'Wolf') then
      noplayerwolves = false
    elseif string.find(gameData[i][9], 'Minion') then
      noplayermin = false
    elseif string.find(gameData[i][9], 'Vampire') or string.find(gameData[i][9], 'The Count') or string.find(gameData[i][9], 'The Master') or gameData[i][18] == '674c02' then
      noplayervamp = false
	elseif string.find(gameData[i][9], 'Alien') or string.find(gameData[i][9], 'Groob') or string.find(gameData[i][9], 'Zerb') or string.find(gameData[i][9], 'Body Snatcher') or string.find(gameData[i][9], 'Synthetic Alien') then
      noplayeralien = false
	elseif string.find(gameData[i][9], 'Temptress') or string.find(gameData[i][9], 'Rapscallion') or string.find(gameData[i][9], 'Dr. Peeker') or string.find(gameData[i][9], 'Henchman #7') then
      noplayervilain = false
    end
  end

  if noplayervamp == false and ((noplayerwolves == false or noplayermin == false) or noplayeralien == false or noplayervilain == false) or (noplayerwolves == false or noplayermin == false) and (noplayervamp == false or noplayeralien == false or noplayervilain == false) or noplayeralien == false and ((noplayerwolves == false or noplayermin == false) or noplayervamp == false or noplayervilain == false) or noplayervilain == false and ((noplayerwolves == false or noplayermin == false) or noplayeralien == false or noplayervamp == false) then
	epic_battle = true
  else
	epic_battle = false
  end

  UI.setXml("")

  cursedpntr = 'null'
  cursedwolf = 0
  cursedvamp = 0

  --this is where we handle votes..
  for i in pairs(gameData) do
	if gameData[i][10] == 'Center' then
		centerVotes = centerVotes + 1
	else
		for j in pairs(gameData) do
		  if gameData[i][10] == j then
			if gameData[i][9] == 'Bodyguard' or gameData[i][9] == 'Dopple-Bodyguard' or gameData[i][9] == 'Defender-er' or gameData[i][9] == 'Dopple-Defender-er'then
			  gameData[j][11] = -100
			  if protected[1] == nil then
				protected[1] = {j, gameData[i][7]}
			  elseif protected[2] == nil then
				protected[2] = {j, gameData[i][7]}
			  elseif protected[3] == nil then
				protected[3] = {j, gameData[i][7]}
			  elseif protected[4] == nil then
				protected[4] = {j, gameData[i][7]}
			  elseif protected[5] == nil then
				protected[5] = {j, gameData[i][7]}
			  end
			elseif gameData[j][9] == 'Prince' or gameData[j][9] == 'Dopple-Prince' or gameData[j][9] == 'The Sponge' or gameData[j][9] == 'Dopple-The Sponge'  then
			  --do nothing
			elseif (gameData[j][9] == 'The Master' or gameData[j][9] == 'Dopple-The Master') and (gameData[i][9] == 'Vampire' and gameData[i][9] == 'The Count' and gameData[i][9] == 'The Master' and gameData[i][9] == 'Dopple-Vampire' and gameData[i][9] == 'Dopple-The Count' and gameData[i][9] == 'Dopple-The Master' and gameData[i][18] == '674c02') then
			  gameData[j][11] = -100
			  if protected[1] == nil then
				protected[1] = {j, gameData[i][7]}
			  elseif protected[2] == nil then
				protected[2] = {j, gameData[i][7]}
			  elseif protected[3] == nil then
				protected[3] = {j, gameData[i][7]}
			  elseif protected[4] == nil then
				protected[4] = {j, gameData[i][7]}
			  elseif protected[5] == nil then
				protected[5] = {j, gameData[i][7]}
			  end
			else
			  if gameData[j][9] == 'Cursed' then
				cursedpntr = j
				if(gameData[i][9] == 'Werewolf' or gameData[i][9] == 'Alpha Wolf' or gameData[i][9] == 'Mystic Wolf' or gameData[i][9] == 'Dream Wolf' or gameData[i][9] == 'Dopple-Werewolf' or gameData[i][9] == 'Dopple-Alpha Wolf' or gameData[i][9] == 'Dopple-Mystic Wolf' or gameData[i][9] == 'Dopple-Dream Wolf') then
				  cursedwolf = cursedwolf + 1
				elseif gameData[j][9] == 'Cursed' and (gameData[i][8] == 'Vampire' or gameData[i][8] == 'The Count' or gameData[i][8] == 'The Master' or gameData[i][8] == 'Dopple-Vampire' or gameData[i][8] == 'Dopple-The Count' or gameData[i][8] == 'Dopple-The Master' or gameData[i][18] == '674c02') then
				  cursedvamp = cursedvamp + 1
				end
			  end
			  if gameData[j][9] == 'Windy Wendy' or gameData[j][9] == 'Dopple-Windy Wendy' then
				if (gameData[i][9] == 'Temptress' or gameData[i][9] == 'Dr. Peeker' or gameData[i][9] == 'Rapscallion' or gameData[i][9] == 'Henchman #7' or gameData[i][9] == 'Dopple-Temptress' or gameData[i][9] == 'Dopple-Dr. Peeker' or gameData[i][9] == 'Dopple-Rapscallion' or gameData[i][9] == 'Dopple-Henchman #7') then
					 gameData[j][9] =  gameData[j][9] .. "-Villain"
				end
			  end
			  gameData[j][11] = gameData[j][11] + 1
			end
		  end
		end
	end
  end

  for i in pairs(gameData) do
    if gameData[i][18] == '674c02' then
      gameData[i][9] = 'Vampire'
    end
  end

  if cursedwolf > 0 then
    gameData[cursedpntr][9] = gameData[cursedpntr][9] .. "-Werewolf"
  end
  if cursedvamp > 0 then
    gameData[cursedpntr][9] = gameData[cursedpntr][9] .. "-Vampire"
  end

  Global.setDecals({})
  plswork = {}
  showResults(1, plswork)

  Wait.time(whodies, numplayers + 1)
  UI.setXmlTable(persistentXML)
end

function whodies()
  numdead = 0
  villagedead = false
  miniondead = false
  tannerdead = false
  dtannerdead = false
  ptannerdead = false
  wolfdead = false
  lovekills = false
  highestVotes = {}
  highestVote = 0
  secondhighestVotes = {}
  secondhighestVote = 0
  rem_forsecondhighest = "null"
  ---insert epic code

  for i in pairs(gameData) do
    ----print(i,", ", gameData[i][11])
    if gameData[i][11] > highestVote then
      local q = {i, gameData[i][7]}
      highestVotes = {}
      highestVote = gameData[i][11]
      table.insert(highestVotes, q)
      rem_forsecondhighest = i
    elseif gameData[i][11] == highestVote then
      local r = {i, gameData[i][7]}
      table.insert(highestVotes, r)
    end
  end

  if epic_battle == true then
    if #highestVotes >= 2 then
      --do nothing two people have already died due to a tie at #1
    else
      for i in pairs(gameData) do
        if i == rem_forsecondhighest then
          --skip!
        elseif gameData[i][11] > secondhighestVote then
          local q = {i, gameData[i][7]}
          secondhighestVotes = {}
          secondhighestVote = gameData[i][11]
          table.insert(secondhighestVotes, q)
        elseif gameData[i][11] == secondhighestVote then
          local r = {i, gameData[i][7]}
          table.insert(secondhighestVotes, r)
        end
      end
	  if secondhighestVote < centerVotes then
		broadcastToAll("The center received the second most votes. No one /else/ dies today.", {1,1,1})
	  else
		  for i in pairs(secondhighestVotes) do
			local s = secondhighestVotes[i]
			table.insert(highestVotes, s)
		  end
	  end
    end
  end
  ----print(highestVote)
  if centerVotes > highestVote then
	broadcastToAll("The center received the most votes. No one dies today.", {1,1,1})
  elseif  highestVote == 1 then
    broadcastToAll("No one got more than one vote. No one dies today.", {1,1,1})
  else
    for i in pairs(highestVotes) do

      if gameData[highestVotes[i][1]][9] == "Ricochet Rhino" then
        local q = {gameData[highestVotes[i][1]][10], gameData[gameData[highestVotes[i][1]][10]][7]}
		broadcastToAll("The attempt to capture " .. highestVotes[i][2] .. " (" .. gameData[highestVotes[i][1]][9] .. ") ricochets!", {1,1,0})
		highestVotes[i] = q
      end


	  broadcastToAll(highestVotes[i][2] .. " (" .. gameData[highestVotes[i][1]][9] .. ") has been killed.", {1,1,0})
      numdead = numdead + 1

      ------------need to figure out a way to distinguish artifact tanner from normal tanner, either check for artifact or change the label
      if string.find(gameData[highestVotes[i][1]][9], 'wolf') or string.find(gameData[highestVotes[i][1]][9], 'Wolf') then
        wolfdead = true
      elseif gameData[highestVotes[i][1]][9] == 'Tanner' then
        tannerdead = true
      elseif gameData[highestVotes[i][1]][9] == 'Dopple-Tanner' then
        dtannerdead = true
      elseif gameData[highestVotes[i][1]][9] == 'Paranormal Investigator-Tanner' then
        ptannerdead = true
      elseif string.find(gameData[highestVotes[i][1]][9], 'Minion') then
        miniondead = true
      else
        villagedead = true
      end


      local deadzone = getObjectFromGUID(gameData[highestVotes[i][1]][2])
      local deadcard = deadzone.getObjects()

      for o,c in ipairs(deadcard) do
        g = c.guid
        rot = c.getRotation()

        if g_table[g] ~= nil then
          c.setRotationSmooth({rot[1],rot[2],0},false,false)
        elseif token_list[g] ~= nil then
          c.setRotationSmooth({rot[1],rot[2],180},false,false)
        end
      end

      if onuv == true then
        deadmarkzone =  getObjectFromGUID(gameData[highestVotes[i][1]][17])
        deadmark = deadmarkzone.getObjects()

        for o,c in ipairs(deadmark) do
          g = c.guid
          rot = c.getRotation()

          if marks_list[g] ~= nil then
            c.setRotationSmooth({rot[1],rot[2],0},false,false)
          end
        end
      end

      if gameData[highestVotes[i][1]][9] == "Hunter" then
        for j in pairs(gameData) do
          if(highestVotes[i][2] == gameData[j][7]) then
            if protected[1][1] ~= nil and j == protected[1][1] then
              broadcastToAll(highestVotes[i][2] .. " (Hunter) attempted to kill " .. gameData[gameData[j][10]][7] .. " but they are protected by " .. protected[1][2], {1,1,0})
            elseif protected[2][1] ~= nil and j == protected[2][1] then
              broadcastToAll(highestVotes[i][2] .. " (Hunter) attempted to kill " .. gameData[gameData[j][10]][7] .. " but they are protected by " .. protected[2][2], {1,1,0})
            elseif protected[3][1] ~= nil and j == protected[3][1] then
              broadcastToAll(highestVotes[i][2] .. " (Hunter) attempted to kill " .. gameData[gameData[j][10]][7] .. " but they are protected by " .. protected[3][2], {1,1,0})
            elseif protected[4][1] ~= nil and j == protected[4][1] then
              broadcastToAll(highestVotes[i][2] .. " (Hunter) attempted to kill " .. gameData[gameData[j][10]][7] .. " but they are protected by " .. protected[4][2], {1,1,0})
            elseif protected[5][1] ~= nil and j == protected[5][1] then
              broadcastToAll(highestVotes[i][2] .. " (Hunter) attempted to kill " .. gameData[gameData[j][10]][7] .. " but they are protected by " .. protected[5][2], {1,1,0})
            else
              broadcastToAll(highestVotes[i][2] .. " (Hunter) killed " .. gameData[gameData[j][10]][7] .. " (" ..gameData[gameData[j][10]][9] .. ").", {1,1,0})
              numdead = numdead + 1
              local hunter_deadzone = getObjectFromGUID(gameData[gameData[j][10]][2])
              local hunter_deadcard = hunter_deadzone.getObjects()

              for p,d in ipairs(hunter_deadcard) do
                hunt_g = d.guid
                hunt_rot = d.getRotation()
                d.setRotationSmooth({hunt_rot[1],hunt_rot[2],0},false,false)
              end

			  if onuv == true then
				huntdeadmarkzone =  getObjectFromGUID(gameData[highestVotes[i][1]][17])
				huntdeadmark = huntdeadmarkzone.getObjects()

				for q,e in ipairs(huntdeadmark) do
				  huntg = e.guid
				  huntrot = e.getRotation()

				  if marks_list[huntg] ~= nil then
					e.setRotationSmooth({huntrot[1],huntrot[2],0},false,false)
				  end
				end
			  end
            end
          end
        end
      end

	if onuv == true and lovekills == false and play_list['Cupid'] ~= nil then
        if gameData[highestVotes[i][1]][18] == '305c28' or gameData[highestVotes[i][1]][18] == '6bcd9d' or gameData[highestVotes[i][1]][18] == 'ae80db' or gameData[highestVotes[i][1]][18] == 'f4902d' then
          lovekills = true
          for c in pairs(gameData) do
            if highestVotes[i][1] ~= c then
              if gameData[c][18] == '305c28' or gameData[c][18] == '6bcd9d' or gameData[c][18] == 'ae80db' or gameData[c][18] == 'f4902d' then
                broadcastToAll(gameData[c][7] .. " (".. gameData[c][9] ..") died of a broken heart. </3", {1,1,1})

				if gameData[c][9] == "Hunter" then
					for j in pairs(gameData) do
						if protected[1][1] ~= nil and j == protected[1][1] then
						  broadcastToAll(gameData[c][7] .. " (Hunter) attempted to kill " .. gameData[c][10] .. " but they are protected by " .. protected[1][2], {1,1,0})
						elseif protected[2][1] ~= nil and j == protected[2][1] then
						  broadcastToAll(gameData[c][7] .. " (Hunter) attempted to kill " .. gameData[c][10] .. " but they are protected by " .. protected[2][2], {1,1,0})
						elseif protected[3][1] ~= nil and j == protected[3][1] then
						  broadcastToAll(gameData[c][7] .. " (Hunter) attempted to kill " .. gameData[c][10] .. " but they are protected by " .. protected[3][2], {1,1,0})
						elseif protected[4][1] ~= nil and j == protected[4][1] then
						  broadcastToAll(gameData[c][7] .. " (Hunter) attempted to kill " .. gameData[c][10] .. " but they are protected by " .. protected[4][2], {1,1,0})
						elseif protected[5][1] ~= nil and j == protected[5][1] then
						  broadcastToAll(gameData[c][7] .. " (Hunter) attempted to kill " .. gameData[c][10] .. " but they are protected by " .. protected[5][2], {1,1,0})
						else
						  broadcastToAll(gameData[c][7] .. " (Hunter) killed " .. gameData[c][10] .. " (" ..gameData[gameData[c][10]][9] .. ").", {1,1,0})
						  numdead = numdead + 1
						  local hunter_deadzone = getObjectFromGUID(gameData[gameData[c][10]][2])
						  local hunter_deadcard = hunter_deadzone.getObjects()

						  for p,d in ipairs(hunter_deadcard) do
							hunt_g = d.guid
							hunt_rot = d.getRotation()
							d.setRotationSmooth({hunt_rot[1],hunt_rot[2],0},false,false)
						  end

						  if onuv == true then
							huntdeadmarkzone =  getObjectFromGUID(gameData[gameData[c][10]][17])
							huntdeadmark = huntdeadmarkzone.getObjects()

							for q,e in ipairs(huntdeadmark) do
							  huntg = e.guid
							  huntrot = e.getRotation()

							  if marks_list[huntg] ~= nil then
								e.setRotationSmooth({huntrot[1],huntrot[2],0},false,false)
							  end
							end
						  end
						end
					end
				end
              end
            end
          end
        end
      end
    end
  end



  --figure out who wins
  --villagewin = false
  --tannerwin = false
  --wolfwin = false
  --if wolfdead then
  --	broadcastToAll("Village Team Wins!", {1,1,0})
  --	villagewin = true
  --elseif numdead == 0 and noplayerwolves and noplayermin then
  --	broadcastToAll("Village Team Wins!", {1,1,0})
  --	villagewin = true
  --elseif noplayerwolves and not noplayermin and miniondead then
  --	broadcastToAll("Village Team Wins!", {1,1,0})
  --	villagewin = true
  --end

  --if tannerdead then
  --	broadcastToAll("Tanner Wins!", {1,1,0})
  --	tannerwin = true
  --elseif dtannerdead then
  --	broadcastToAll("Dopple-Tanner Wins!", {1,1,0})
  --	tannerwin = true
  --elseif ptannerdead then
  --	broadcastToAll("Paranormal Investigator-Tanner Wins!", {1,1,0})
  --	tannerwin = true
  --end

  --if noplayerwolves and not noplayermin and not miniondead then
  --	broadcastToAll("Werewolf Team Wins!", {1,1,0})
  --	wolfwin = true
  --elseif not wolfdead and not tannerwin then
  --	broadcastToAll("Werewolf Team Wins!", {1,1,0})
  --	wolfwin = true
  --end

  setUnknownsText()
  resetButton()
end

function showResults(counter, lines)
  ----print("num players, counter: " .. numplayers .. " , " .. counter)
  local curColor = playerc_list[counter][2]
  if gameData[curColor][10] == "null" and gameData[curColor][1] then --Defender-er
    printToAll(gameData[curColor][7].." didn't vote.") --this should never happen
  elseif gameData[curColor][1] then
	if gameData[curColor][10] == 'Center' then
	  printToAll(gameData[curColor][7] .. " voted for the Center.", gameData[curColor][13])
    elseif gameData[curColor][9] == 'Bodyguard' or gameData[curColor][9] == 'Dopple-Bodyguard' or gameData[curColor][9] == 'Defender-er' or gameData[curColor][9] == 'Dopple-Defender-er' then
      printToAll(gameData[curColor][7] .. " is protecting " .. gameData[gameData[curColor][10]][7], gameData[curColor][13])
   else
      printToAll(gameData[curColor][7] .. " voted for " .. gameData[gameData[curColor][10]][7], gameData[curColor][13])
    end
	
	if gameData[curColor][10] == 'Center' then
		local temp = {
		  points    = { gameData[curColor][5], {0,0.97,0} } ,
		  color     = gameData[curColor][13],
		  thickness = 0.5,
		  rotation  = {0,0,0},
		}
		table.insert(lines, temp)
		Global.setVectorLines(lines)
	else
		local temp = {
		  points    = { gameData[curColor][5], gameData[gameData[curColor][10]][6] } ,
		  color     = gameData[curColor][13],
		  thickness = 0.5,
		  rotation  = {0,0,0},
		}
		table.insert(lines, temp)
		Global.setVectorLines(lines)
	end
  end

  if counter == numplayers then
    --do nothing
  else
    counter = counter + 1
    Wait.time(function() showResults(counter, lines) end,1)
  end
end

function playSound(x)
	bit_speaker.AssetBundle.playTriggerEffect(x)
end

function noiseMake()
  if math.random(10) == 10 then
    ran = math.random(10)
    pos1 = noise_cards[ran].getPosition()[1]
    pos2 = noise_cards[ran].getPosition()[2]
    pos3 = noise_cards[ran].getPosition()[3]
    pos2 = pos2 + 2
    noise_cards[ran].setPosition({pos1,pos2,pos3})
  end
end

function claimSelected(player, option, id)
  if gameData[player.color][12] then
    claims = self.getDecals()
    for i in pairs(claims) do
      if claims[i].name == player.color then
        table.remove(claims, i)
      end
    end
  end

  if option == "No claim" then
    gameData[player.color][12] = false
  else
    local params = {
      name = player.color,
      url = img[option][1],
      position = gameData[player.color][3],
      rotation = gameData[player.color][4],
      scale = {4,5,5},
    }
    table.insert(claims,params)
    gameData[player.color][12] = true
  end
  Global.setDecals(claims)
end

function take_callback(object,ncard_pos,ncard_rot,nbool_lock)
  object.setPosition(ncard_pos)
  object.setRotation(ncard_rot)
  object.setLock(nbool_lock)
end

function setupTime(player, value, id)
  gtvalue = tonumber(value)
  if gtvalue < 1 then
    broadcastToColor('You cannot set the game timer to less than 1 minute.', player.color, {1,1,0})
  else
	UI.setAttribute(id, "text", value)
    broadcastToAll("Game Timer has been set. There will be " .. gtvalue .. " minutes to vote during the day.", {1,1,1})
    gtvalue = gtvalue*60
    timerset = true
    countdown.call('setTime', gtvalue)
  end
end

function setroleTime(player, value, id)
  rtvalue = tonumber(value)
  if rtvalue < 0 then
    broadcastToColor('You cannot set the role timer to less than 0 seconds.', player.color, {1,1,0})
  else
	UI.setAttribute(id, "text", value)
    timeperturn = rtvalue
    broadcastToAll("Role Timer has been set. After the announcer's instructions, you will have " .. rtvalue .. " seconds for your night action.", {1,1,1})
  end
end


function showGameSetup(player, clicked, id)
  if (clicked == "True") then
    UI.setAttribute("gameSetup","active","true")
  else
    UI.setAttribute("gameSetup","active","false")
  end
end

function markboardMove(player, clicked)
  if clicked == 'True' then
    UI.setAttribute("markboardMoveToggle","isOn","true")
    for i,v in pairs(mb_initialLocation) do
      object = getObjectFromGUID(v[1])
      object.setPosition(v[2])
      object.setRotation({0,180,0})
      if v[1] ~= 'c5bb80' then
        object.setLock(false)
      end
    end
  else
	UI.setAttribute("markboardMoveToggle","isOn","false")
    for i,v in pairs(mb_initialLocation) do
      object = getObjectFromGUID(v[1])
      object.setPosition(v[3])
      object.setRotation({0,180,0})
      object.setLock(true)
    end
  end
end

function dealmarks(player, clicked)
  if clicked == 'True' then
	UI.setAttribute("dealmarkstoggle","isOn","true")
    for i,v in ipairs(color_list) do
      if Player[v].seated == true then
        markobject = getObjectFromGUID(markboard[v][2])
        targetzone = getObjectFromGUID(markboard[v][1])
        tmppos = targetzone.getPosition()
        tmprot = targetzone.getRotation()
        markobject.setPosition(tmppos)
        markobject.setRotation(tmprot)
        markobject.setLock(false)
      end
    end
    UI.setAttribute("pmarks","text","Return Marks to Display Area")
    UI.setAttribute("pmarks","offsetXY","-86 0")
  else
	UI.setAttribute("dealmarkstoggle","isOn","false")
    for i,v in ipairs(color_list) do
      markobject = getObjectFromGUID(markboard[v][2])
      targetzone = getObjectFromGUID(markboard[v][1])
      markobject.setPosition(markboard[v][3])
      markobject.setRotation({0,0,0})
      markobject.setLock(true)
    end
    UI.setAttribute("pmarks","text","Place Marks in front of seated players")
    UI.setAttribute("pmarks","offsetXY","-49 0")
  end
end

function moveCards(player, value, id)
  if id == "Sentinel1" or id == "Sentinel2" then
	placeholder = initialLocation['Sentinel']
  else
	placeholder = initialLocation[id]
  end
  --print("movemarks: ", id)
  if UI.getAttribute(id, "color") == "#808080" then
    UI.setAttribute(id, "color", "#FFFFFF")

	if id == "Sentinel1" or id == "Sentinel2" then
		id = "Sentinel"
	end

    if id == 'Curator' then
      crate = getObjectFromGUID(placeholder[6])
      crate.setPosition(placeholder[8])
      crate.setLock(false)
    elseif id == 'Alpha Wolf' then
      if getObjectFromGUID(placeholder[6]) ~= nil then
        awolf = getObjectFromGUID(placeholder[6])
        awolf.setPosition(placeholder[8])
        awolf.setRotation({0,90,180})
        awolf.setLock(false)

      else
        printToColor("Error: Script was unable to move the Alpha Wolf's extra Werewolf, it's currently in a stack.", player.color, {1,0,0})
      end
      table.insert(roletokentraker,placeholder[9])
      arrangeRoleTokens()

    elseif id == 'Temptress' then
      if getObjectFromGUID(placeholder[6]) ~= nil then
        awolf = getObjectFromGUID(placeholder[6])
        awolf.setPosition(placeholder[8])
        awolf.setRotation({0,90,180})
        awolf.setLock(false)

      else
        printToColor("Error: Script was unable to move the Temptress' Henchman, it's currently in a stack.", player.color, {1,0,0})
      end
      table.insert(roletokentraker,placeholder[9])
      arrangeRoleTokens()

    elseif id == 'Sentinel' then
      shield1 = getObjectFromGUID(placeholder[6])
      shield2 = getObjectFromGUID(placeholder[9])
      shield1.setPosition(placeholder[8])
      shield2.setPosition(placeholder[11])
      shield1.setRotation({0,180,180})
      shield2.setRotation({0,180,180})
      shield1.setLock(false)
      shield2.setLock(false)
    end

    card_pos = {0,1,0}
    card_rot = {0,180,180}
    bool_lock = false
    if getObjectFromGUID(placeholder[1]) ~= nil then
      card = getObjectFromGUID(placeholder[1])
      card.setPosition({0,1,0})
      card.setRotation({0,180,180})
      card.setLock(false)
    else
      allObjects = allthings.getObjects()
      for o,c in ipairs(allObjects) do
        n = c.getQuantity()
        if n ~= -1 then
          d = c.getObjects()
          for q in pairs(d) do
            if d[q].guid == placeholder[1] then
              takeParams = {
                guid = placeholder[1],
                callback_function = function(obj) take_callback(obj, card_pos, card_rot, bool_lock) end,
              }
              c.takeObject(takeParams)
            end
          end
        end
      end
    end
    table.insert(roletokentraker,placeholder[3])
    arrangeRoleTokens()

  else
    UI.setAttribute(id, "color", "#808080")

	if id == "Sentinel1" or id == "Sentinel2" then
		id = "Sentinel"
	end

    if id == 'Curator' then
      crate = getObjectFromGUID(placeholder[6])
      crate.setPosition(placeholder[7])
      crate.setLock(true)
    elseif id == 'Alpha Wolf' then
      if getObjectFromGUID(placeholder[6]) ~= nil then
        awolf = getObjectFromGUID(placeholder[6])
        awolf.setPosition(placeholder[7])
        awolf.setRotation({0,180,0})
      else
        printToColor("Error: Script was unable to move the Alpha Wolf's extra Werewolf, it's currently in a stack.", player.color, {1,0,0})
      end

      for index, tokenguid in ipairs(roletokentraker) do
        if tokenguid == placeholder[9] then
          table.remove(roletokentraker,index)
        end
      end

      awolftoken = getObjectFromGUID(placeholder[9])
      awolftoken.setPosition(placeholder[10])
      awolftoken.setRotation({0,180,0})
      awolftoken.setLock(true)
      arrangeRoleTokens()

    elseif id == 'Temptress' then
      if getObjectFromGUID(placeholder[6]) ~= nil then
        awolf = getObjectFromGUID(placeholder[6])
        awolf.setPosition(placeholder[7])
        awolf.setRotation({0,180,0})
      else
        printToColor("Error: Script was unable to move the Temptress' Henchman, it's currently in a stack.", player.color, {1,0,0})
      end

      for index, tokenguid in ipairs(roletokentraker) do
        if tokenguid == placeholder[9] then
          table.remove(roletokentraker,index)
        end
      end

      awolftoken = getObjectFromGUID(placeholder[9])
      awolftoken.setPosition(placeholder[10])
      awolftoken.setRotation({0,180,0})
      awolftoken.setLock(true)
      arrangeRoleTokens()

    elseif id == 'Sentinel' then
      shield1 = getObjectFromGUID(placeholder[6])
      shield2 = getObjectFromGUID(placeholder[9])
      shield1.setPosition(placeholder[7])
      shield2.setPosition(placeholder[10])
      shield1.setRotation({0,180,180})
      shield2.setRotation({0,180,180})
      shield1.setLock(true)
      shield2.setLock(true)
    end

    card_pos = placeholder[2]
    card_rot = {0,180,0}
    bool_lock = true
    if getObjectFromGUID(placeholder[1]) ~= nil then
      card = getObjectFromGUID(placeholder[1])
      card.setPosition(card_pos)
      card.setRotation(card_rot)
      card.setLock(true)
    else
      allObjects = allthings.getObjects()
      for o,c in ipairs(allObjects) do
        n = c.getQuantity()
        if n ~= -1 then
          d = c.getObjects()
          for q in pairs(d) do
            if d[q].guid == placeholder[1] then
              takeParams = {
                guid = placeholder[1],
                callback_function = function(obj) take_callback(obj, card_pos, card_rot, bool_lock) end,
              }
              c.takeObject(takeParams)
            end
          end
        end
      end
    end
    for index, tokenguid in ipairs(roletokentraker) do
      if tokenguid == placeholder[3] then
        table.remove(roletokentraker,index)
      end
    end
    token = getObjectFromGUID(placeholder[3])
    token.setPositionSmooth(placeholder[4],false,false)
    token.setRotation({0,180,0},false,false)
    token.setLock(true)
    arrangeRoleTokens()

  end
end

function arrangeRoleTokens()
  local xmovement = 0
  local ymovement = 0
  for index, tokenguid in ipairs(roletokentraker) do
    ----print("what is here: ",index,", ", tokenguid)
    token = getObjectFromGUID(tokenguid)
    token.setPositionSmooth({7.67	+ xmovement, 1.13, 0.77 + ymovement},false,false)
    token.setRotationSmooth({0,0,0},false,false)
    token.setLock(false)
    xmovement = xmovement + 1.42

    if index%4 == 0 then
      xmovement = 0
      ymovement = ymovement - 1.42
    end
  end
end

function checkStart(player, value, id)
  for i,v in ipairs(color_list) do
    if Player[v].seated and Player[v].blindfolded == false then
      Player[v].blindfolded = true
    end
  end
  UI.setAttribute("gameSetup","active","false")
  persistentXML = UI.getXmlTable()
  UI.setAttribute("startGame","active","false")
  UI.setAttribute("setupButton","active","false")
  card_states = {}
  night_phase = true
  doubleCheck()
end

function cancelGame()
  Global.setDecals({})
  phase = 0
  phase_name = ''
  play_list = {}
  player_list = {}

  for i=1, #wait_ids do
	Wait.stop(wait_ids[i])
  end

  broadcastToAll("Game canceled by host/admin", {1,1,1})
  resetButton()
  night_phase = false
  for i,v in ipairs(color_list) do
    if Player[v].seated and Player[v].blindfolded == true then
      Player[v].blindfolded = false
    end
  end

  bg_speaker.AssetBundle.playLoopingEffect(0)
  UI.setXmlTable(persistentXML)
end

function villageIdiot(player, value, id)
  UI.setAttribute("VIChoice","active","false")
  VIxml = ''
  vi_color_list = {}
  local j = 1
  for i =1, #color_list do
    hasShield = false
    zone = getObjectFromGUID(gameData[color_list[i]][16])
    token = zone.getObjects()

    if token[1] ~= nil then
      if token[1].guid == '2ace33' or token[1].guid == '8dfb26' then

        hasShield = true
      end

    end

    if gameData[color_list[i]][1] == true and color_list[i] ~= player.color and not hasShield then
      table.insert(vi_color_list, j, color_list[i])
      j = j + 1
    end
    hasShield = false
  end


  if id == "Left" then
    for i=1, #vi_color_list do
      ----print(vi_color_list[i])
      zone = getObjectFromGUID(gameData[vi_color_list[#vi_color_list + 1 - i]][2])
      card = zone.getObjects()

      if #vi_color_list - i ~= 0 then
        counter = #vi_color_list - i
      else
        counter = #vi_color_list
      end

      card[1].setPositionSmooth(gameData[vi_color_list[counter]][14],false, false)
      card[1].setRotationSmooth(gameData[vi_color_list[counter]][15],false, false)
    end
  else
    for i=1, #vi_color_list do

      zone = getObjectFromGUID(gameData[vi_color_list[i]][2])
      card = zone.getObjects()

      if i + 1 <= #vi_color_list then
        counter = i + 1
      else
        counter = 1
      end

      card[1].setPositionSmooth(gameData[vi_color_list[counter]][14],false, false)
      card[1].setRotationSmooth(gameData[vi_color_list[counter]][15],false, false)
    end
  end
end

function villageIdiotUI(color)
	VIxml = '<Panel id="VIChoice" offSetXY=" -400" width="500" height="75" visibility="Black|' .. color .. '"><Button id="Left" offSetXY="-150 0"  width="200" height="75" onClick="villageIdiot">Move Cards Left</Button><Button id="Right" offSetXY="150 0"  width="200" height="75" onClick="villageIdiot">Move Cards Right</Button></Panel>'
	UI.setXml(VIxml)
end

function makeRoleUI()
  xml = '<Defaults><Panel class="role" width="100" height="150" onClick="moveCards" color="#808080"/><Panel class="filter" width="1" height="1" onClick="filterUI" color="#FFFFFF"/></Defaults>'
  xml = xml .. '<Panel offsetXY="653 -60" color="Black" width="470" height="830" id="gameSetup" visibility="Host|Admin" active="false" allowDragging ="true" returnToOriginalPositionWhenReleased="false"><Panel offsetXY="0 400" id="toptext"><Text color="Yellow" fontSize="19">SELECT THE ROLES YOU WANT IN THE GAME</Text></Panel><Panel offsetXY="0 360" id="filtermenu"><HorizontalLayout width="470" height="50" spacing="5"><Panel id="fil_ONUW" class="filter" image="fil_ONUW"></Panel><Panel id="fil_ONUWD" class="filter" image="fil_ONUWD"></Panel><Panel id="fil_ONUV" class="filter" image="fil_ONUV"></Panel><Panel id="fil_ONUA" class="filter" image="fil_ONUA"></Panel><Panel id="fil_ONUSV" class="filter" image="fil_ONUSV"></Panel><Panel id="fil_ONUBR" class="filter" image="fil_ONUBR"></Panel></HorizontalLayout></Panel><VerticalScrollView offsetXY="0 15" width="470" height="628" noScrollbars="false" scrollSensitivity="20" color="Black"><GridLayout id="roleChart" width="470" height="' .. (math.ceil(#EZUIrole / 4) * 150) + (math.ceil(#EZUIrole / 4) * 7) .. '" cellSize="105 150" spacing="7 7">'
  for i=1, #EZUIrole do
	if EZUIrole[i][1] ~= 'Sentinel1' then
      xml = xml .. '<Panel id="' .. EZUIrole[i][1] .. '" class="role" image="' .. EZUIrole[i][2] .. '" active="true"></Panel>'
	else
	  xml = xml .. '<Panel id="' .. EZUIrole[i][1] .. '" class="role" image="' .. EZUIrole[i][2] .. '" active="false"></Panel>'
	end
  end

  xml = xml .. '</GridLayout></VerticalScrollView><Panel offsetXY="0 -310"><Text offsetXY="-55 0" color="Yellow" fontSize="19">Game Timer (Time to Vote, Minutes)</Text><InputField id="setGameTimeID" offsetXY="195 0" width="40" characterValidation="Integer" characterLimit="2" onEndEdit="setupTime" text="5"></InputField></Panel><Panel offsetXY="0 -340"><Text offsetXY="-21 0" color="Yellow" fontSize="19">Role Timer (Time for Each Phase, Seconds)</Text><InputField id="setRoleTimer" offsetXY="195 0" width="40" characterValidation="Integer" characterLimit="2" onEndEdit="setroleTime" text="10"></InputField></Panel><Panel width="470" offsetXY="0 -370"><Text offsetXY="-67 0" color="Yellow" fontSize="19">Bring ONUV Markboard to Center</Text><Toggle id="markboardMoveToggle" offsetXY="190 0" width="34" onValueChanged="markboardMove"></Toggle></Panel><Panel width="470" offsetXY="0 -400"><Text id="pmarks" offsetXY="-49 0" color="Yellow" fontSize="19">Place Marks in front of seated players</Text><Toggle id="dealmarkstoggle" offsetXY="190 0" width="34" onValueChanged="dealmarks"></Toggle></Panel></Panel><ToggleButton id="customButton" color="Grey" width="100" height="57" offsetXY="500 -503" visibility="Host|Admin" onValueChanged="showCustomRules">House Rules</ToggleButton><ToggleButton id="aliensButton" color="Green" width="100" height="57" offsetXY="610 -503" visibility="Host|Admin" onValueChanged="showAlienSettings">ONUA RNG</ToggleButton><ToggleButton id="setupButton" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onValueChanged="showGameSetup">EZ Game Setup</ToggleButton><Button id="startGame" color="Red" width="100" height="57" offsetXY="720 -503" visibility="Host|Admin" onClick="checkStart">Start Game</Button><Button id="usurpOrange" color="Orange" width="100" height="57" offsetXY="0 0" visibility="Host|Admin" active="false" onClick="usurpOrange">Usurp Orange</Button>'
    xml = xml .. '<Panel offsetXY="653 -60" color="Green" width="300" height="830" id="alienRNGPanel" visibility="Host|Admin" active="false" allowDragging ="true" returnToOriginalPositionWhenReleased="false"><TableLayout columnWidths="220 70"><Row preferredHeight="35"><Text color="Black" fontSize="19">RANDOMIZATION</Text></Row></TableLayout><VerticalScrollView offsetXY="5 -15" width="300" height="800" noScrollbars="false" scrollSensitivity="20" color="00ff00"><TableLayout autoCalculateHeight="True" columnWidths="230 70"><Row preferredHeight="29"><Text color="Black" fontSize="19">RIPPLE</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The time to vote is set to 1 minute, overwrites Alien timer effect." tooltipPosition="Left" tooltipBackgroundColor="Black">1 minute</Text></Cell><Cell><InputField id="ripple1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Dusk/night phases are repeated. Players will wake and take actions based on their original role." tooltipPosition="Left" tooltipBackgroundColor="Black">Repeat</Text></Cell><Cell><InputField id="ripple2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Dusk/night phases are repeated. Players will wake and take actions based on their original role. One player will be allowed to be awake throughout the repeated phase." tooltipPosition="Left" tooltipBackgroundColor="Black">Repeat 1P</Text></Cell><Cell><InputField id="ripple3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Insomniacs action." tooltipPosition="Left" tooltipBackgroundColor="Black">Insomniac</Text></Cell><Cell><InputField id="ripple4" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[4][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One, some, or all players may not speak until after the vote." tooltipPosition="Left" tooltipBackgroundColor="Black">May Not Speak</Text></Cell><Cell><InputField id="ripple5" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[5][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Troublemakers action." tooltipPosition="Left" tooltipBackgroundColor="Black">Troublemaker</Text></Cell><Cell><InputField id="ripple6" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[6][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Robbers action." tooltipPosition="Left" tooltipBackgroundColor="Black">Steal</Text></Cell><Cell><InputField id="ripple7" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[7][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Witchs action." tooltipPosition="Left" tooltipBackgroundColor="Black">Witch</Text></Cell><Cell><InputField id="ripple8" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[8][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be allowed to view 1 card." tooltipPosition="Left" tooltipBackgroundColor="Black">View 1</Text></Cell><Cell><InputField id="ripple9" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[9][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be allowed to view 2 cards." tooltipPosition="Left" tooltipBackgroundColor="Black">View 2</Text></Cell><Cell><InputField id="ripple10" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[10][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Revealers action." tooltipPosition="Left" tooltipBackgroundColor="Black">Reveal</Text></Cell><Cell><InputField id="ripple11" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[11][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Two players will wake to view one card." tooltipPosition="Left" tooltipBackgroundColor="Black">Dual View</Text></Cell><Cell><InputField id="ripple12" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[12][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One, some, or all players will have 2 votes." tooltipPosition="Left" tooltipBackgroundColor="Black">Two Hand (not scripted yet)</Text></Cell><Cell><InputField id="ripple13" characterValidation="Integer" readOnly="true" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[13][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Two players will wakes a show their cards to eachother. Then the cards are shuffled and redistributed." tooltipPosition="Left" tooltipBackgroundColor="Black">Dual Shuffle</Text></Cell><Cell><InputField id="ripple14" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[14][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One player will be called to do a Drunks action." tooltipPosition="Left" tooltipBackgroundColor="Black">Drunk</Text></Cell><Cell><InputField id="ripple15" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[15][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The option to vote for center will be enabled. If the center gets the most votes, no one dies." tooltipPosition="Left" tooltipBackgroundColor="Black">Vote for Center</Text></Cell><Cell><InputField id="ripple16" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[16][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One role that has a night action is called to repeat their night action." tooltipPosition="Left" tooltipBackgroundColor="Black">Repeat Role (not scripted yet)</Text></Cell><Cell><InputField id="ripple17" readOnly="true" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[17][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="One, some, or all players will be be restricted to only saying: I am an Alien." tooltipPosition="Left" tooltipBackgroundColor="Black">I am an Alien</Text></Cell><Cell><InputField id="ripple18" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[18][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Nothing happens." tooltipPosition="Left" tooltipBackgroundColor="Black">None</Text></Cell><Cell><InputField id="ripple19" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rippleRandTable[19][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">ORACLE</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they want to join the Alien Team. If no Aliens are in play, the Oracle is asked to guess a number between 1 and 10." tooltipPosition="Left" tooltipBackgroundColor="Black">Alien Team</Text></Cell><Cell><InputField id="oracle1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they want to join the Werewolf Team. If no Werewolfs are in play, the Oracle is asked to guess a number between 1 and 10." tooltipPosition="Left" tooltipBackgroundColor="Black">Werewolf Team</Text></Cell><Cell><InputField id="oracle2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they want to join the Vampire Team. If no Vampires are in play, the Oracle is asked to guess a number between 1 and 10." tooltipPosition="Left" tooltipBackgroundColor="Black">Vampire Team</Text></Cell><Cell><InputField id="oracle3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they would like to force the Aliens to exchange cards." tooltipPosition="Left" tooltipBackgroundColor="Black">Alien Exchange</Text></Cell><Cell><InputField id="oracle4" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[4][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they would like to exchange cards with the center." tooltipPosition="Left" tooltipBackgroundColor="Black">Exchange</Text></Cell><Cell><InputField id="oracle5" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[5][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they would like to view 3 center cards." tooltipPosition="Left" tooltipBackgroundColor="Black">Center</Text></Cell><Cell><InputField id="oracle6" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[6][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they would like to force a ripple." tooltipPosition="Left" tooltipBackgroundColor="Black">Ripple</Text></Cell><Cell><InputField id="oracle7" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[7][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked if they have an even or odd player number." tooltipPosition="Left" tooltipBackgroundColor="Black">Even Odd</Text></Cell><Cell><InputField id="oracle8" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[8][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked which player number they would like to look at." tooltipPosition="Left" tooltipBackgroundColor="Black">Player Number</Text></Cell><Cell><InputField id="oracle9" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[9][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The oracle is asked to guess a number between 1 and 10." tooltipPosition="Left" tooltipBackgroundColor="Black">Number</Text></Cell><Cell><InputField id="oracle10" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..oracleRandTable[10][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">ALIEN</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Each Alien may view 1 card in secret." tooltipPosition="Left" tooltipBackgroundColor="Black">View</Text></Cell><Cell><InputField id="alien1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Together, the Aliens may view a card." tooltipPosition="Left" tooltipBackgroundColor="Black">All View</Text></Cell><Cell><InputField id="alien2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens do not do anything special." tooltipPosition="Left" tooltipBackgroundColor="Black">Stare</Text></Cell><Cell><InputField id="alien3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The time to vote is cut in half, this effect can stack if a repeat ripple occurs and this effect happens a second time." tooltipPosition="Left" tooltipBackgroundColor="Black">Timer</Text></Cell><Cell><InputField id="alien4" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[4][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens will give their card to the Alien on their left." tooltipPosition="Left" tooltipBackgroundColor="Black">Left</Text></Cell><Cell><InputField id="alien5" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[5][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens will give their card to the Alien on their right." tooltipPosition="Left" tooltipBackgroundColor="Black">Right</Text></Cell><Cell><InputField id="alien6" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[6][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens will show eachother their cards." tooltipPosition="Left" tooltipBackgroundColor="Black">Show</Text></Cell><Cell><InputField id="alien7" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[7][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens will turn a PLAYER (not their card) into an Alien." tooltipPosition="Left" tooltipBackgroundColor="Black">New Alien (not scripted yet)</Text></Cell><Cell><InputField id="alien8" readOnly="true" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[8][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Aliens will turn a PLAYER (not their card) into a member of the Alien Team, but not an Alien." tooltipPosition="Left" tooltipBackgroundColor="Black">Alien Helper (not scripted yet)</Text></Cell><Cell><InputField id="alien9" readOnly="true" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..alienRandTable[9][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">BODY SNATCHER</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Body Snatcher swaps his card an other players card." tooltipPosition="Left" tooltipBackgroundColor="Black">Steal</Text></Cell><Cell><InputField id="bodySnatcher1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..bodySnatcherRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Body Snatcher swaps his card a card in the Center." tooltipPosition="Left" tooltipBackgroundColor="Black">Center</Text></Cell><Cell><InputField id="bodySnatcher2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..bodySnatcherRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Body Snatcher does not body snatch a card." tooltipPosition="Left" tooltipBackgroundColor="Black">Pretend</Text></Cell><Cell><InputField id="bodySnatcher3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..bodySnatcherRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">PSYCHIC</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Psychic may view 1 card." tooltipPosition="Left" tooltipBackgroundColor="Black">View 1</Text></Cell><Cell><InputField id="psychic1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..psychicRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Psychic may view 2 cards." tooltipPosition="Left" tooltipBackgroundColor="Black">View 2</Text></Cell><Cell><InputField id="psychic2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..psychicRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">RASCAL</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Rascal will do the Witch night action." tooltipPosition="Left" tooltipBackgroundColor="Black">Witch</Text></Cell><Cell><InputField id="rascal1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rascalRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Rascal will do the Village Idiot night action." tooltipPosition="Left" tooltipBackgroundColor="Black">  Idiot</Text></Cell><Cell><InputField id="rascal2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rascalRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Rascal will do the Drunk night action." tooltipPosition="Left" tooltipBackgroundColor="Black">  Drunk</Text></Cell><Cell><InputField id="rascal3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rascalRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Rascal will do the Troublemaker night action." tooltipPosition="Left" tooltipBackgroundColor="Black">  Troublemaker</Text></Cell><Cell><InputField id="rascal4" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rascalRandTable[4][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Rascal will do the robber night action." tooltipPosition="Left" tooltipBackgroundColor="Black">  Robber</Text></Cell><Cell><InputField id="rascal5" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..rascalRandTable[5][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">EXPOSER</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Exposer may flip 1 center cards." tooltipPosition="Left" tooltipBackgroundColor="Black">1 Card</Text></Cell><Cell><InputField id="exposer1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..exposerRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Exposer may flip 2 center cards." tooltipPosition="Left" tooltipBackgroundColor="Black">2 Cards</Text></Cell><Cell><InputField id="exposer2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..exposerRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Exposer may flip 3 center cards." tooltipPosition="Left" tooltipBackgroundColor="Black">3 Cards</Text></Cell><Cell><InputField id="exposer3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..exposerRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">EMPATH</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Players will be asked to point at who they think the Empath is." tooltipPosition="Left" tooltipBackgroundColor="Black">Think</Text></Cell><Cell><InputField id="empath1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..empathRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Players will be asked to point at who they think is awesome." tooltipPosition="Left" tooltipBackgroundColor="Black">Awesome</Text></Cell><Cell><InputField id="empath2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..empathRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Players will be asked to point at who they think everyone else if pointing at." tooltipPosition="Left" tooltipBackgroundColor="Black">Everyone Else</Text></Cell><Cell><InputField id="empath3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..empathRandTable[3][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="Players will be asked to point at the friendliest player." tooltipPosition="Left" tooltipBackgroundColor="Black">Friendliest</Text></Cell><Cell><InputField id="empath4" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..empathRandTable[4][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Text color="Black" fontSize="19">MORTICIAN</Text></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Mortician can look at none of their neighbors cards." tooltipPosition="Left" tooltipBackgroundColor="Black">Pretend</Text></Cell><Cell><InputField id="mortician1" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..morticianRandTable[1][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Mortician can look at one of their neighbors cards." tooltipPosition="Left" tooltipBackgroundColor="Black">1 Card</Text></Cell><Cell><InputField id="mortician2" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..morticianRandTable[2][2]..'"></InputField></Cell></Row><Row preferredHeight="29"><Cell><Text alignment = "MiddleLeft" tooltip="The Mortician can look at both of their neighbors cards." tooltipPosition="Left" tooltipBackgroundColor="Black">2 Cards</Text></Cell><Cell><InputField id="mortician3" characterValidation="Integer" characterLimit="3" onEndEdit="changeRNG" text="'..morticianRandTable[3][2]..'"></InputField></Cell></Row></TableLayout></VerticalScrollView></Panel>'
  xml = xml .. '<Panel offsetXY="653 -60" color="Grey" width="250" height="250" id="customRulesPanel" visibility="Host|Admin" active="false" allowDragging ="true" returnToOriginalPositionWhenReleased="false"><TableLayout><Row preferredHeight="35"><Text color="Black" fontSize="19" tooltip="If a house rule you like or play with is not listed, leave a comment in the work shop." tooltipPosition="Left" tooltipBackgroundColor="Black">HOUSE RULEZ</Text></Row><Row preferredHeight="29"><Toggle offsetXY="-20 0" id="centerVote" tooltip="During the day, players will be able to vote for the center. If the Center gets the most votes, no one dies." tooltipPosition="Left" tooltipBackgroundColor="Black" onValueChanged="changeHouseRule">Center Voting</Toggle></Row><Row preferredHeight="29"><Toggle offsetXY="-20 0" id="wolfMercy" interactable="false" tooltip="Not scipted or enforced yet. If a Werewolf is solo AND the card they see in the center is a Werewolf or Minion, allow them to view a second card." tooltipPosition="Left" tooltipBackgroundColor="Black" onValueChanged="donothing">Wolf Mercy</Toggle></Row></TableLayout></Panel>'
    
  return xml
end

function changeHouseRule(player, clicked, id)
	if id == "centerVote" then
		if centerVoteEnabled == true then
			UI.setAttribute("centerVote","isOn","false")
			centerVoteEnabled = false
		else
			UI.setAttribute("centerVote","isOn","true")
			centerVoteEnabled = true
		end
	end
end

function showCustomRules(player, clicked, id)
  if (clicked == "True") then
    UI.setAttribute("customRulesPanel","active","true")
  else
    UI.setAttribute("customRulesPanel","active","false")
  end
end

function showAlienSettings(player, clicked, id)
 
  if (clicked == "True") then
    
    UI.setAttribute("alienRNGPanel","active","true")
  else
    UI.setAttribute("alienRNGPanel","active","false")
  end
end

function filterUI(player,value,id)
  Wait.time(function() updateEZUIRoles(id) end,0.01)
  Wait.time(adjustScroll,0.08)
end

function updateEZUIRoles(id)
  if UI.getAttribute(id, "color") == "#808080" then
    UI.setAttribute(id, "color","#FFFFFF")

    for i,v in pairs(EZUIrole) do

      if id == v[3] then
        UI.setAttribute(v[1], "active", "true")
      end
    end
  elseif self.UI.getAttribute(id, "color") == "#FFFFFF" then
    self.UI.setAttribute(id, "color","#808080")

    for i,v in pairs(EZUIrole) do
	 if id == v[3] then
        UI.setAttribute(v[1], "active", "false")
      end
    end
  end
  Wait.time(adjustSentinel,0.01)
end

function adjustSentinel()
	if UI.getAttribute("fil_ONUV", "color") == "#808080" then
		fil_ONUVon = false
	else
		fil_ONUVon = true
	end
	if UI.getAttribute("fil_ONUWD", "color") == "#808080" then
		fil_ONUWDon = false
	else
		fil_ONUWDon = true
	end

  if fil_ONUVon == true and fil_ONUWDon == true then
   UI.setAttribute("Sentinel1", "active", "false")
   UI.setAttribute("Sentinel2", "active", "true")
  elseif fil_ONUWDon == true then
	UI.setAttribute("Sentinel1", "active", "true")
	UI.setAttribute("Sentinel2", "active", "false")
  else
	UI.setAttribute("Sentinel1", "active", "false")
	UI.setAttribute("Sentinel2", "active", "false")
  end
end

function adjustScroll()
  local activecount = 0
  for i,v in pairs(EZUIrole) do
    atmp = UI.getAttribute(v[1],"active")
    ----print(atmp)
    if atmp == "true" then
      activecount = activecount + 1
    end
  end
  ----print(activecount)
  ----print((math.ceil(activecount / 4) * 150) + (math.ceil(activecount / 4) * 7))
  UI.setAttribute("roleChart", "height", (math.ceil(activecount / 4) * 150) + (math.ceil(activecount / 4) * 7))
end

function checkTokens()
  for i,v in pairs(areas) do
    zone = getObjectFromGUID(v[3])
    tokens = zone.getObjects()
    for i,t in ipairs(tokens) do
      g = t.guid
      if token_list[g] ~= nil then
        if token_list[g] ~= 'You have the shield. Your card cannot be looked at or moved.' and not string.find(v[2], 'Center') then
          if Player[v[2]].seated then
            broadcastToColor(' ', v[2], {0,0,0})
            broadcastToColor(token_list[g], v[2], {1,1,0})
            if g == 'b6ba43' then
              local randtimewait = math.random(3,8)
			  waitvar = Wait.time(|| blindfoldShroudofShame(v[2]), randtimewait)
				--if g == 'd7bbed' then
				--Player[v[2]].mute() this probably isnt the best way to handle it, as it takes away bluff ability
            end
          end
        end
      end
    end
  end
end

function blindfoldShroudofShame(Shrouded)
	Shrouded_Player = Shrouded
	Player[Shrouded].blindfolded = true
end

function piMessage()
  if phase_name == 'Doppelganger' then
    if Player[dop_pi_color].seated then
      printToColor(' ', dop_pi_color, {0,0,0})
      printToColor(' ', dop_pi_color, {0,0,0})
      printToColor("You are now a ".. dop_pi_change ..'!', dop_pi_color, {0.118, 0.53, 1})
      printToColor("You may not look at any more cards.", dop_pi_color, {0.118, 0.53, 1})
    end
  elseif phase_name == 'Paranormal Investigator' then
    if Player[pi_color].seated then
      printToColor(' ', pi_color, {0,0,0})
      printToColor("You are now a ".. pi_change ..'!', pi_color, {0.118, 0.53, 1})
      printToColor("You may not look at any more cards.", pi_color, {0.118, 0.53, 1})
    end
  end
end

function auraText()
  local aura  = {}
  for i,c in ipairs(color_list) do
    if aura_list[c] ~= nil then
      local tmp = {
        name = "aura",
        url = "http://cloud-3.steamusercontent.com/ugc/1468689354625471137/90AFDDB4ECB03C2040FBFA18E68420910E60FD1D/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,4,4},
      }
      table.insert(aura, tmp)
    end
  end
  Global.setDecals(aura)
end

function onObjectLeaveScriptingZone(z,lo)
  if night_phase then
    if phase_name ~= '' then
      if g_table[lo.guid] ~= nil or marks_list[lo.guid] ~= nil then
        aura_list[play_list[phase_name]] = 'moved'
      end
    end
  end
end

function onPeek(color)
  if night_phase then
    if phase_name ~= '' and color ~= 'Black' then
      aura_list[color] = 'peeked'
    end
  end
end

function catMessage()
  play_list[cat_change] = cat_color
  if Player[cat_color].seated then
    printToColor(' ', cat_color, {0,0,0})
    printToColor("You are now the "..cat_change..'!', cat_color, {0.118, 0.53, 1})
    printToColor("Don't do any actions yet.", cat_color, {0.118, 0.53, 1})
  end
end

function mirrorMessage()
  play_list[mirror_change] = mirror_color
  if Player[mirror_color].seated then
    printToColor(' ', mirror_color, {0,0,0})
    printToColor("You are now the "..mirror_change..'!', mirror_color, {0.118, 0.53, 1})
    printToColor("Don't do any actions yet.", mirror_color, {0.118, 0.53, 1})
  end
end

function swapMarks(player, value, id)
  UI.setAttribute("swapMarks","active","false")
  SwapXml = ''

  ----print("phasename and value and dopplechange: ",phase_name,", ",value,", ",dopple_change)
  if phase_name == 'Vampire' then
    firstzone = getObjectFromGUID(markboard[1][1])
  elseif phase_name == 'The Count' then
    firstzone = getObjectFromGUID(markboard[2][1])
  elseif phase_name == 'Dopple-The Count' then
    firstzone = getObjectFromGUID(markboard[3][1])
  elseif phase_name == 'Diseased' then
    firstzone = getObjectFromGUID(markboard[6][1])
  elseif phase_name == 'Doppelganger' and dopple_change == 'Diseased' then
    firstzone = getObjectFromGUID(markboard[7][1])
  elseif phase_name == 'Cupid' and value == '-1' then
    firstzone = getObjectFromGUID(markboard[8][1])
  elseif phase_name == 'Cupid' and value == '0' then
    firstzone = getObjectFromGUID(markboard[10][1])
  elseif phase_name == 'Doppelganger' and dopple_change == 'Cupid' and value == '-1' then
    firstzone = getObjectFromGUID(markboard[9][1])
  elseif phase_name == 'Doppelganger' and dopple_change == 'Cupid' and value == '0' then
    firstzone = getObjectFromGUID(markboard[11][1])
  elseif phase_name == 'Instigator' then
    firstzone = getObjectFromGUID(markboard[12][1])
  elseif phase_name == 'Doppelganger' and dopple_change == 'Instigator' then
    firstzone = getObjectFromGUID(markboard[13][1])
  elseif phase_name == 'Priest' then
    firstzone = getObjectFromGUID(markboard[16][1])
  elseif phase_name == 'Dopple-Priest' then
    firstzone = getObjectFromGUID(markboard[17][1])
  elseif phase_name == 'Assassin' then
	firstzone = getObjectFromGUID(markboard[18][1])
	assassinText()
  elseif phase_name == 'Apprentice Assassin' then
    firstzone = getObjectFromGUID(markboard[18][1])
  elseif phase_name == 'Dopple-Assassin' then
    firstzone = getObjectFromGUID(markboard[19][1])
	assassinText()
  elseif phase_name == 'Pickpocket' then
    firstzone = getObjectFromGUID(gameData[player.color][17])
  elseif phase_name == 'Dopple-Pickpocket' then
    firstzone = getObjectFromGUID(gameData[player.color][17])
  end

  firstmark = firstzone.getObjects()

  secondzone = getObjectFromGUID(gameData[id][17])
  secondmark = secondzone.getObjects()

  tmppos = firstmark[1].getPosition()
  tmprot = firstmark[1].getRotation()

  firstmark[1].setPositionSmooth(secondmark[1].getPosition(),false,false)
  firstmark[1].setRotationSmooth(secondmark[1].getRotation(), false,false)
  secondmark[1].setPositionSmooth(tmppos,false,false)
  secondmark[1].setRotationSmooth(tmprot, false,false)

  if phase_name == 'Cupid' and value == '-1' or phase_name == 'Doppelganger' and dopple_change == 'Cupid' and value == '-1' then
    swapMarksUI("a",id)
  end
end

function involswapMarks()
  if phase_name == 'Renfield' then
    firstzone = getObjectFromGUID(markboard[4][1])
  elseif phase_name == 'Dopple-Renfield' then
    firstzone = getObjectFromGUID(markboard[5][1])
  elseif phase_name == 'Priest' then
    firstzone = getObjectFromGUID(markboard[14][1])
  elseif phase_name == 'Dopple-Priest' then
    firstzone = getObjectFromGUID(markboard[15][1])
  end

  firstmark = firstzone.getObjects()

  for i,v in ipairs(color_list) do
    if player_list[v] == phase_name then
      secondzone = getObjectFromGUID(gameData[v][17])
    end
  end

  secondmark = secondzone.getObjects()

  tmppos = firstmark[1].getPosition()
  tmprot = firstmark[1].getRotation()

  firstmark[1].setPositionSmooth(secondmark[1].getPosition(),false,false)
  firstmark[1].setRotationSmooth(secondmark[1].getRotation(), false,false)
  secondmark[1].setPositionSmooth(tmppos,false,false)
  secondmark[1].setRotationSmooth(tmprot, false,false)
end

function swapMarksUI(first_call, remove)
  ----print('SwapMarksUI called')
  swap_colors = {}
  j = 1
  visto = 'Black'
  if phase_name == 'Vampire' then
    for i in pairs(gameData) do
      if gameData[i][1] == true and (gameData[i][8] ~= 'Vampire' and gameData[i][8] ~= 'The Count' and gameData[i][8] ~= 'The Master' and gameData[i][8] ~= 'Dopple-Vampire' and gameData[i][8] ~= 'Dopple-The Count' and gameData[i][8] ~= 'Dopple-The Master')  then
        table.insert(swap_colors, j, i)
        j = j + 1
      elseif gameData[i][1] then
        visto = visto .. "|" .. i .. ""
      end
    end
  elseif phase_name == 'The Count' or phase_name == 'Dopple-The Count' then
    for i in pairs(gameData) do
      markzone = getObjectFromGUID(gameData[i][17])
      mark = markzone.getObjects()
      if gameData[i][1] == true and (gameData[i][8] ~= 'Vampire' and gameData[i][8] ~= 'The Count' and gameData[i][8] ~= 'The Master' and gameData[i][8] ~= 'Dopple-Vampire' and gameData[i][8] ~= 'Dopple-The Count' and gameData[i][8] ~= 'Dopple-The Master' and mark[1].guid ~= '674c02')  then
        table.insert(swap_colors, j, i)
        j = j + 1
      elseif gameData[i][8] == phase_name then
        visto = visto .. "|" .. i .. ""
      end
    end
  elseif phase_name == 'Diseased' or (phase_name == 'Doppelganger' and dopple_change == 'Diseased') then

    for i=1, #playerc_list do 			--change to playerc_list
      if (phase_name == 'Diseased' and gameData[playerc_list[i][2]][8] == 'Diseased') or (phase_name == 'Doppelganger' and gameData[playerc_list[i][2]][8] == 'Dopple-Diseased')  then
        visto = visto .. "|" .. playerc_list[i][2] .. ""

        if i == 1 then
          table.insert(swap_colors, 1, playerc_list[numplayers][2]) 	--gonna have to figure this out when changed
          table.insert(swap_colors, 2, playerc_list[2][2])
        elseif i == numplayers then               	--change to num players
          table.insert(swap_colors, 1, playerc_list[numplayers-1][2]) 	--gonna have to figure this out when changed --comebackhere
          table.insert(swap_colors, 2, playerc_list[1][2])
        else
          table.insert(swap_colors, 1, playerc_list[i-1][2]) 	--gonna have to figure this out when changed
          table.insert(swap_colors, 2, playerc_list[i+1][2])
        end
      end
    end
  elseif phase_name == 'Cupid' or (phase_name == 'Doppelganger' and dopple_change == 'Cupid') then
    for i in pairs(gameData) do 		--maybe change with playerc_list
      if (phase_name == 'Cupid' and gameData[i][8] == 'Cupid') or (phase_name == 'Doppelganger' and gameData[i][8] == 'Dopple-Cupid')  then
        visto = visto .. "|" .. i .. ""
      end
      if i == remove then
        --do nothing
      elseif gameData[i][1] == true then
        table.insert(swap_colors, j, i)
        j = j + 1
      end
    end
  elseif phase_name == 'Instigator' or (phase_name == 'Doppelganger' and dopple_change == 'Instigator') then
    for i in pairs(gameData) do 		--maybe change with playerc_list
      if gameData[i][1] == true then
        table.insert(swap_colors, j, i)
        j = j + 1
      end
      if (phase_name == 'Instigator' and gameData[i][8] == 'Instigator') or (phase_name == 'Doppelganger' and gameData[i][8] == 'Dopple-Instigator')  then
        visto = visto .. "|" .. i .. ""
      end
    end
  elseif phase_name == 'Assassin' or phase_name == 'Dopple-Assassin' or phase_name =='Apprentice Assassin' then
    for i in pairs(gameData) do 		--maybe change with playerc_list
      if gameData[i][1] == true then
        table.insert(swap_colors, j, i)
        j = j + 1
      end

      if gameData[i][8] == phase_name then
        visto = visto .. "|" .. i .. ""
      end
    end
  elseif phase_name == 'Priest' or phase_name == 'Dopple-Priest' then
    for i in pairs(gameData) do 		--maybe change with playerc_list
      if gameData[i][8] ~= phase_name and gameData[i][1] == true then
        table.insert(swap_colors, j, i)
        j = j + 1
      elseif gameData[i][1] == true then
        visto = visto .. "|" .. i .. ""
      end
    end
  elseif phase_name == 'Pickpocket' or phase_name == 'Dopple-Pickpocket' then
    for i in pairs(gameData) do 		--maybe change with playerc_list
      if gameData[i][8] ~= phase_name and gameData[i][1] == true then
        table.insert(swap_colors, j, i)
        j = j + 1
      elseif gameData[i][1] == true then
        visto = visto .. "|" .. i .. ""
      end
    end
  end

  ----print("visto: ",visto)
  SwapXml = '<GridLayout id="swapMarks" offsetXY="0 -825"  width="'.. 100 * math.ceil(#swap_colors/2)..'" active="true" visibility="'..visto..'" cellSize="100 75">'
  for i=1, #swap_colors do
    if remove ~= "b" then
      SwapXml = SwapXml .. '<Button id="'.. swap_colors[i] ..'" color="'.. swap_colors[i] ..'"  onClick="swapMarks(0)"></Button>'
    else
      SwapXml = SwapXml .. '<Button id="'.. swap_colors[i] ..'" color="'.. swap_colors[i] ..'"  onClick="swapMarks" ></Button>'
    end
  end
  SwapXml = SwapXml .. '</GridLayout>'

  if phase_name == 'Doppelganger' or (phase_name == 'Cupid' and remove ~= "b") then
    xml = '<Text id="timelabel" offsetXY="-750 515" fontSize="20" color="White" active="true">Time left in phase:</Text><Text id="timeleft" offsetXY="-750 460" fontSize="100" color="White" active="true">'.. other_time ..'</Text><Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>'
    finalxml = xml .. SwapXml
    UI.setXml(finalxml)
  end
end

function thingUI()
  visto = 'Black'
  tap_colors = {}
  for i=1, #playerc_list do 			--change to playerc_list
    if ((phase_name == 'Thing' and gameData[playerc_list[i][2]][8] == 'Thing') or (phase_name == 'Doppelganger' and gameData[playerc_list[i][2]][8] == 'Dopple-Thing')) or ((phase_name == 'Annoying Lad' and gameData[playerc_list[i][2]][8] == 'Annoying Lad') or (phase_name == 'Doppelganger' and gameData[playerc_list[i][2]][8] == 'Dopple-Annoying Lad'))  then
      visto = visto .. "|" .. playerc_list[i][2] .. ""

      if i == 1 then
        table.insert(tap_colors, 1, playerc_list[numplayers][2])
        table.insert(tap_colors, 2, playerc_list[2][2])
      elseif i == numplayers then
        table.insert(tap_colors, 1, playerc_list[numplayers-1][2])
        table.insert(tap_colors, 2, playerc_list[1][2])
      else
        table.insert(tap_colors, 1, playerc_list[i-1][2])
        table.insert(tap_colors, 2, playerc_list[i+1][2])
      end
    end
  end

  ThingXml = '<GridLayout id="tap" offsetXY="0 -825"  width="200" active="true" visibility="'..visto..'" cellSize="100 75">'
  for i=1, #tap_colors do
    if i == 1 then
      ThingXml = ThingXml .. '<Button id="'.. tap_colors[i] ..'" color="'.. tap_colors[i] ..'"  onClick="thingTap(Right)" ></Button>'
    else
      ThingXml = ThingXml .. '<Button id="'.. tap_colors[i] ..'" color="'.. tap_colors[i] ..'"  onClick="thingTap(Left)" ></Button>'
    end
  end
  ThingXml = ThingXml .. '</GridLayout>'

  if phase_name == 'Doppelganger' then
    xml = '<Text id="timelabel" offsetXY="-750 515" fontSize="20" color="White" active="true">Time left in phase:</Text><Text id="timeleft" offsetXY="-750 460" fontSize="100" color="White" active="true">'.. other_time ..'</Text><Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>'
    finalxml = xml .. ThingXml
    UI.setXml(finalxml)
  end
end

function thingTap(player,value,id)
  if phase_name == 'Thing' or dopple_change == 'Thing' then
	  ThingXml = ''
	  UI.setAttribute("tap","active","false")
  elseif phase_name == 'Annoying Lad' or dopple_change == 'Annoying Lad' then
	  if id == tap_colors[1] then
		UI.setAttribute(tap_colors[2],"active","false")
	  elseif id == tap_colors[2] then
		UI.setAttribute(tap_colors[1],"active","false")
	  end
  end
  if phase_name == 'Thing' or dopple_change == 'Thing' then
	broadcastToColor('You have been bumped by the player to your ' ..value..'.', id, {1,1,0})
  elseif phase_name == 'Annoying Lad' or dopple_change == 'Annoying Lad' then
	broadcastToColor('The player to your ' ..value..' is trying to annoy you. How annoying...', id, {1,1,0})
  end
end

function assassinText()
  local appassaasin  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Apprentice Assassin' or player_list[c] == 'Dopple-Apprentice Assassin' then
      local tmp = {
        name = "App Assassin",
        url = "http://cloud-3.steamusercontent.com/ugc/1468689039028718024/A2D41BE44E40AA2466DBA868FE313FA67A0E22A2/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(appassaasin, tmp)
    end
  end
  Global.setDecals(appassaasin)
end

function appAssassinText()
  local assaasin  = {}
  for i,c in ipairs(color_list) do
    if player_list[c] == 'Assassin' then
      local tmp = {
        name = "Assassin",
        url = "http://cloud-3.steamusercontent.com/ugc/1468689039028718637/C75D1305C9F1D8C11596526B7C8F489770F3DEFC/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,5,5},
      }
      table.insert(assaasin, tmp)
    end
  end
  Global.setDecals(assaasin)
end

function printMarks()
  for i,c in ipairs(color_list) do
    if Player[c].seated == true then
      markzone = getObjectFromGUID(gameData[c][17])
      mark = markzone.getObjects()
      g = mark[1].guid
      gameData[c][18] = g
      broadcastToColor(marks_list[g], c, {1,0,0})
    end
  end
end

function loveText() --did not work
  local lovers  = {}
  ----print("lovers start")
  for i,c in ipairs(color_list) do
    ----print('color ', c)
    ----print('gamedata ',gameData[c][18])
    if (gameData[c][18] == '305c28' or gameData[c][18] == '6bcd9d'  or gameData[c][18] == 'ae80db'  or gameData[c][18] == 'f4902d')  then
      ----print("is a lover")
      local tmp = {
        name = "Lovers",
        url = "http://cloud-3.steamusercontent.com/ugc/1468689396414271195/8C9C6CA23CECB6976882E359A879212309559A7D/",
        position = gameData[c][3],
        rotation = gameData[c][4],
        scale = {4,4,4},
      }
      table.insert(lovers, tmp)
    end
  end
  Global.setDecals(lovers)
end

function gremlinUI(color)
  ----print('am i making it here? : ',color)
  Gxml = '<Panel id="MMChoice" offSetXY=" -400" width="500" height="75" visibility="Black|' .. color .. '" active="true"><Button id="Cards" offSetXY="-150 0"  width="200" height="75" onClick="gswapui">Swap Cards</Button><Button id="Marks" offSetXY="150 0"  width="200" height="75" onClick="gswapui">Swap Marks</Button></Panel>'
  UI.setXml(Gxml)
end

function gswapui(player, value, id)
  if ((phase_name == 'Doppelganger' and dopple_change == 'Troublemaker' or phase_name == 'Troublemaker') and id =='Cards') or ((phase_name == 'Doppelganger' and dopple_change == 'Switcheroo' or phase_name == 'Switcheroo') and id =='Cards') or ((phase_name == 'Rascal' and rascalRole == 'Troublemaker') and id=='Cards') then
    playercolor = player
  else
    playercolor = player.color
  end

  UI.setAttribute("MMChoice","active","false")
  Gxml = ''
  cards_swap_colors = {}
  MMchoice = id
  ----print("gswapui id: ", id)
  local swapiter = 1


  if (phase_name == 'Doppelganger' and dopple_change == 'Troublemaker' or phase_name == 'Troublemaker') or (phase_name == 'Doppelganger' and dopple_change == 'Switcheroo' or phase_name == 'Switcheroo') or (phase_name == 'Rascal' and rascalRole == 'Troublemaker') then
    for i,c in ipairs(color_list) do
      hasShield = false
      zone = getObjectFromGUID(gameData[c][16])
      token = zone.getObjects()

      if token[1] ~= nil then
        if token[1].guid == '2ace33' or token[1].guid == '8dfb26' then
          ----print(color_list[i] .. "  has the shield?  ")
          hasShield = true
        end
      end


      if gameData[c][1] == true and c ~= playercolor and not hasShield and c ~= id  then
        table.insert(cards_swap_colors, swapiter, c)
        swapiter = swapiter + 1
      end

      hasShield = false
    end
  else
    for i,c in ipairs(color_list) do
      hasShield = false
      zone = getObjectFromGUID(gameData[c][16])
      token = zone.getObjects()

      if token[1] ~= nil then
        if token[1].guid == '2ace33' or token[1].guid == '8dfb26' then
          ----print(color_list[i] .. "  has the shield?  ")
          hasShield = true
        end
      end
      --add this before going live gameData[c][1] == true and
      if gameData[c][1] == true and not hasShield and c ~= id and gameData[c][1] == true then
        table.insert(cards_swap_colors, swapiter, c)
        swapiter = swapiter + 1
      end

      hasShield = false
    end
  end

  ----print('Gremlin, color: ',id,", ", playercolor)
  MMXml = '<GridLayout id="swapselect" offsetXY="0 -825"  width="'.. 100 * math.ceil(#cards_swap_colors/2)..'" active="true" visibility="Black|'..playercolor..'" cellSize="100 75">'
  for i=1, #cards_swap_colors do
    if value == '-1' then
      MMXml = MMXml .. '<Button id="'.. cards_swap_colors[i] ..'" color="'.. cards_swap_colors[i] ..'"  onClick="setswapees" ></Button>'
    elseif value ~= '-1' then
      MMXml = MMXml .. '<Button id="'.. cards_swap_colors[i] ..'" color="'.. cards_swap_colors[i] ..'"  onClick="setswapees(0)" ></Button>'
    end
  end
  MMXml = MMXml .. '</GridLayout>'
  xml = '<Text id="timelabel" offsetXY="-750 515" fontSize="20" color="White" active="true">Time left in phase:</Text><Text id="timeleft" offsetXY="-750 460" fontSize="100" color="White" active="true">'.. other_time ..'</Text><Button id="cancelGame" color="Red" width="100" height="57" offsetXY="830 -503" visibility="Host|Admin" onClick="cancelGame">Cancel Game</Button>'
  finalxml = xml .. MMXml
  UI.setXml(finalxml)
end

--this function correlates selections to objectzones
function setswapees(player,value,id)
  UI.setAttribute("swapselect","active","false")
  MMXml = ''
  ----print('id, value: ',id, ", ", value)
  if MMchoice == "Marks" then
    y = 17
  elseif MMchoice == "Cards" then
    y = 2
  end
  ----print("This is the guid associated with that color: ", gameData[id][y])
  if value == '-1' then
    firstpick = getObjectFromGUID(gameData[id][y])
    gswapui(player,"0",id)
  elseif value == '0' then
    secondpick = getObjectFromGUID(gameData[id][y])
    twoplayerswap(firstpick,secondpick)
  end
end

---this will be called once the two players have been selected.
function twoplayerswap(p_firstswap, p_secondswap)
  first = p_firstswap.getObjects()
  second = p_secondswap.getObjects()

  tmppos = first[1].getPosition()
  tmprot = first[1].getRotation()

  first[1].setPositionSmooth(second[1].getPosition(),false,false)
  first[1].setRotationSmooth(second[1].getRotation(), false,false)
  second[1].setPositionSmooth(tmppos,false,false)
  second[1].setRotationSmooth(tmprot, false,false)
end

function resetButton()
  reset_buttons = reset_object.getButtons()
  removeResetButton()
  local params = {}
  params.click_function = 'resetTable'
  params.color = 'Red'
  params.width = 1600
  params.height = 500
  params.font_size = 250
  params.position = {0, 0.5, 0}
  params.rotation = {0, 0, 0}
  params.function_owner = self
  params.label = 'Reset Table'
  reset_object.createButton(params)
end

function resetTable(obj, color)
  if Player[color].admin ~= true then return end
  clearVectorPaint()
  clearUnknownsText()
  xmovement = 0
  ymovement = 0
  printerror = false
  removeResetButton()
  for index,card in pairs(cards_used_in_game) do
    card_object = getObjectFromGUID(card)
    if card ~= nil and card_object ~= nil then
      if card_object.guid == '673e45' or card_object.guid == 'e61a25' then
        card_object.setRotationSmooth({0,90,180},false,false)
        card_object.setPosition({0, 1.5, -4.28},false,false)
      else
        card_object.setRotationSmooth({0,180,180},false,false)
        card_object.setPositionSmooth({0, 1.5, 0},false,false)
      end
      token = getObjectFromGUID(g_table[card][2])
      if token ~= nil then
        token.setPositionSmooth({7.67	+ xmovement, 1.13, 0.77 + ymovement},false,false)
        token.setRotationSmooth({0,0,0},false,false)
        xmovement = xmovement + 1.42

        if index%4 == 0 then
          xmovement = 0
          ymovement = ymovement - 1.42
        end
      end
    elseif card ~= nil then
      printerror = true
    end

  end

  if onuv == true then
    for index,markzone in pairs(marks_used_in_game) do
      mark_object = getObjectFromGUID(markzone[1])
      if mark_object ~= nil then
        mark_object.setPositionSmooth(markzone[2],false,false)
        mark_object.setRotationSmooth(markzone[3],false,false)
        ----print("What's in here? index, markzone guid, : ", index, ", ",markzone[1],", ",markzone[2],", ",markzone[3])
      end
    end
  end

  if printerror == true then
    printToColor("Error: unable to reset table fully when cards/marks/tokens have been stacked.", color, {1,0,0})
  end

  cards_used_in_game = {}
  marks_used_in_game = {}
end

function removeResetButton()
  reset_buttons = reset_object.getButtons()
  if reset_buttons == nil then return end
  for o,c in pairs(reset_buttons) do
    reset_object.removeButton(o-1)
  end
end

function getCardsUsedInGame()
  cards_used_in_game = {}
  for i,v in pairs(areas) do
    zone = getObjectFromGUID(v[1])
    for o,c in ipairs(zone.getObjects()) do
      g = c.guid
      if g_table[g] ~= nil then
        card_object = getObjectFromGUID(g)
        if card_object ~= nil then
          table.insert(cards_used_in_game, 1, g)
        end
      end
    end
  end
end

function getMarksUsedInGame()
  marks_used_in_game = {}
  for i,v in pairs(markboard) do
    zone = getObjectFromGUID(v[1])
    for o,c in ipairs(zone.getObjects()) do
      g = c.guid
      if marks_list[g] ~= nil then
        mark_object_pos = c.getPosition()
        mark_object_rot = c.getRotation()
        h = {g, mark_object_pos, mark_object_rot}
        if card_object ~= nil then
          table.insert(marks_used_in_game, 1, h)
        end
      end
    end
  end
end

function evilometermsg()

  evilometer_color = ''
  evil_trigger = false
  sus_colors = {}
  for i=1, #playerc_list do 			--change to playerc_list
    if phase_name == 'Villains' and gameData[playerc_list[i][2]][8] == 'Evilometer' or gameData[playerc_list[i][2]][8] == 'Dopple-Evilometer' then
      evilometer_color = playerc_list[i][2]

      if i == 1 then
        table.insert(sus_colors, 1, playerc_list[numplayers][2])
        table.insert(sus_colors, 2, playerc_list[2][2])
      elseif i == numplayers then
        table.insert(sus_colors, 1, playerc_list[numplayers-1][2])
        table.insert(sus_colors, 2, playerc_list[1][2])
      else
        table.insert(sus_colors, 1, playerc_list[i-1][2])
        table.insert(sus_colors, 2, playerc_list[i+1][2])
      end

	  for j=1, #sus_colors do
		if gameData[sus_colors[j]][8] == 'Temptress' or gameData[sus_colors[j]][8] == 'Dr. Peeker' or gameData[sus_colors[j]][8] == 'Rapscallion' or gameData[sus_colors[j]][8] == 'Henchman #7' or gameData[sus_colors[j]][8] == 'Dopple-Temptress' or gameData[sus_colors[j]][8] == 'Dopple-Dr. Peeker' or gameData[sus_colors[j]][8] == 'Dopple-Rapscallion' or gameData[sus_colors[j]][8] == 'Dopple-Henchman #7' then
			evil_trigger = true
		end
	  end

	  if evil_trigger == true then
	    broadcastToColor("Your evilometer is going bonkers! The player to your left and/or the player to your right are Villains.", evilometer_color, {1,0,0})
      elseif evil_trigger == false then
  	    broadcastToColor("Your evilometer does not alert you. The player to your left and the player to your right are not Villains.", evilometer_color, {1,0,0})
      end
	  evil_trigger = false
	  sus_colors = {}
    end
  end
end

function cowmsg()

  cow_color = ''
  cow_trigger = false
  sus_colors = {}
  for i=1, #playerc_list do 			--change to playerc_list
    if phase_name == 'Alien' and gameData[playerc_list[i][2]][8] == 'Cow' or gameData[playerc_list[i][2]][8] == 'Dopple-Cow' then
      cow_color = playerc_list[i][2]

      if i == 1 then
        table.insert(sus_colors, 1, playerc_list[numplayers][2])
        table.insert(sus_colors, 2, playerc_list[2][2])
      elseif i == numplayers then
        table.insert(sus_colors, 1, playerc_list[numplayers-1][2])
        table.insert(sus_colors, 2, playerc_list[1][2])
      else
        table.insert(sus_colors, 1, playerc_list[i-1][2])
        table.insert(sus_colors, 2, playerc_list[i+1][2])
      end

	  for j=1, #sus_colors do
		if gameData[sus_colors[j]][8] == 'Alien' or gameData[sus_colors[j]][8] == 'Synthetic Alien' or gameData[sus_colors[j]][8] == 'Groob' or gameData[sus_colors[j]][8] == 'Zerb' or gameData[sus_colors[j]][8] == 'Body Snatcher' or gameData[sus_colors[j]][8] == 'Dopple-Alien' or gameData[sus_colors[j]][8] == 'Dopple-Synthetic Alien' or gameData[sus_colors[j]][8] == 'Dopple-Groob' or gameData[sus_colors[j]][8] == 'Dopple-Zerb' or gameData[sus_colors[j]][8] == 'Dopple-Body Snatcher' then
			cow_trigger = true
		end
	  end

	  if cow_trigger == true then
	    broadcastToColor("Those prankster Aliens tipped you! The player to your left and/or the player to your right are Aliens.", cow_color, {1,0,0})
      elseif cow_trigger == false then
  	    broadcastToColor("You remain untipped. The player to your left and the player to your right are not Aliens.", cow_color, {1,0,0})
      end
	  cow_trigger = false
	  sus_colors = {}
    end
  end
end

function onPlayerConnect(person)
	if person.steam_id == '76561197976685793' and Player["Black"].seated == false then
		broadcastToAll("Blinky The Red Ghost has entered the game. Spooky.", "Red")
		person.changeColor("Black")
	end
end

function rippleRandomization()
	ripplePlayOrder = {}


	chosenone = math.random(numplayers)
	chosentwo = chosenone 

	while chosenone == chosentwo do 
		if numplayers == 1 then
			chosentwo = 2
		else
			chosentwo = math.random(numplayers)
		end
	end

	if firstripple == true then
		firstripple = false

		if oracleForceRipple == false then
			if rippleRandTable[19][3] == 0 then
				rippleRandTable[19][3] = 100
			end
			randRipple = math.random(rippleRandTable[1][1]+1,rippleRandTable[19][3])
		elseif oracleForceRipple == true then
			if rippleRandTable[18][3] == 0 then
				rippleRandTable[18][3] = 100
			end
			randRipple = math.random(rippleRandTable[1][1]+1,rippleRandTable[18][3])
		end

		if randRipple <= tonumber(rippleRandTable[18][3]) then  
			role_list[phase][2] = role_list[phase][2] + 3.239
			table.insert(ripplePlayOrder, {3.239,155})
			play_list['Ripple']='on'
		end

		if randRipple <= tonumber(rippleRandTable[1][3]) then
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. You will only have one minute before you have to vote."
			role_list[phase][2] = role_list[phase][2] + 3.318
			table.insert(ripplePlayOrder, {3.318,130})
			local tmptvalue = -60
			countdown.call('setTime', tmptvalue)
		elseif randRipple <= tonumber(rippleRandTable[2][3]) then 
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. You've entered a time loop, and must repeat the entire night."
			role_list[phase][2] = role_list[phase][2] + 7.393
			table.insert(ripplePlayOrder, {7.393,140})
			ripplerepeat = true
		elseif randRipple <= tonumber(rippleRandTable[3][3]) then 
			ripplerepeatonep = true
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. You've entered a time loop, and must repeat the entire night. Player "..chosenone..", keep your eyes open from this point forward."
			role_list[phase][2] = role_list[phase][2] + 4.153
			role_list[phase][2] = role_list[phase][2] + 6.687
			table.insert(ripplePlayOrder, {4.153,141})

			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					RchosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
			role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1]
			table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			table.insert(ripplePlayOrder, {6.687,142})
		elseif randRipple <= tonumber(rippleRandTable[4][3]) then		
			rippleInsom = true
			rippleInsomPlayers = {}
			rippleInsomPlayers = empathRandNumTarg()
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. ".. rippleInsomPlayers[1][2].." you may secretly view your own card."
			role_list[phase][2] = role_list[phase][2] + 2.712 + timeperturn
			local tmptable = rippleInsomPlayers[1][3]
			for i=1, #tmptable do
				table.insert(ripplePlayOrder, tmptable[i])
				role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
            end
			table.insert(ripplePlayOrder, {2.717, 139})
			rippleInsomPlayerz = rippleInsomPlayers[1][1]
			rippleInsomPlayerzz = {}
			for i=1, #rippleInsomPlayerz do
				--print("whats in here?: i: ",i, ", v: ",rippleInsomPlayerz[i])
				rippleInsomPlayerzz[rippleInsomPlayerz[i]] = 'on'
			end
		elseif randRipple <= tonumber(rippleRandTable[5][3]) then 
			rippleMute = true
			rippleMutePlayers = {}
			rippleMutePlayers = empathRandNumTarg()
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. ".. rippleMutePlayers[1][2].." you may not speak speak until after the vote."
        role_list[phase][2] = role_list[phase][2] + 2.638
        local tmptable = rippleMutePlayers[1][3]
        for i=1, #tmptable do
			table.insert(ripplePlayOrder, tmptable[i])
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        end
        table.insert(ripplePlayOrder, {2.638, 146})
		elseif randRipple <= tonumber(rippleRandTable[6][3]) then
			target = randNumTarg(2)
            local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone.." you may exchange cards between "..target[1][2]..". Do not look at either card."
			role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1] + timeperturn
			table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			role_list[phase][2] = role_list[phase][2] + 2.194 + 2.403
			table.insert(ripplePlayOrder, {2.194,149})
		    for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
			table.insert(ripplePlayOrder, tmptable[i])
		    end
			table.insert(ripplePlayOrder, {2.403,150})

			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
		elseif randRipple <= tonumber(rippleRandTable[7][3]) then	
			target = randNumTarg(1)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you may steal a card from "..target[1][2]..". If you do, look at your new card."
      role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1] + timeperturn
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
      role_list[phase][2] = role_list[phase][2] + 2.064 + 2.664
      table.insert(ripplePlayOrder, {2.064,147})
      for i=1, #tmptable do
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        table.insert(ripplePlayOrder, tmptable[i])
      end
      table.insert(ripplePlayOrder, {2.664,148})									
			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
		elseif randRipple <= tonumber(rippleRandTable[8][3]) then	
			target = randNumTarg(1)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you may view one center card. If you do, you must give it to "..target[1][2].."."
      role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1] + timeperturn
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
      role_list[phase][2] = role_list[phase][2] + 5.016
      table.insert(ripplePlayOrder, {5.016,154})
      for i=1, #tmptable do
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        table.insert(ripplePlayOrder, tmptable[i])
      end
	  			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
    elseif randRipple <= tonumber(rippleRandTable[9][3]) then		
			target = randNumTarg(3)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you may view one card from "..target[1][2].."."
      role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1] + timeperturn
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
      role_list[phase][2] = role_list[phase][2] + 2.142
      table.insert(ripplePlayOrder, {2.142,151})
      for i=1, #tmptable do
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        table.insert(ripplePlayOrder, tmptable[i])
      end
	  			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
		elseif randRipple <= tonumber(rippleRandTable[10][3]) then 
			target = randNumTarg(2)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you may view the cards of "..target[1][2].."."
      role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1]
      role_list[phase][2] = role_list[phase][2] + 2.220 + timeperturn
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
      table.insert(ripplePlayOrder, {2.220,152})
      for i=1, #tmptable do
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        table.insert(ripplePlayOrder, tmptable[i])
      end
	  			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
		elseif randRipple <= tonumber(rippleRandTable[11][3]) then			--55
			target = randNumTarg(1)
			  local tmptable = target[1][3]
			  role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you may turn over one card from "..target[1][2]..". If that card is on the Village team, leave it face up. Otherwise, turn if back face down."
			  role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1]
			  role_list[phase][2] = role_list[phase][2] + 2.508 + 7.367 + timeperturn
			  table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			  table.insert(ripplePlayOrder, {2.508,144})
			  for i=1, #tmptable do
				role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
				table.insert(ripplePlayOrder, tmptable[i])
			  end
			  table.insert(ripplePlayOrder, {7.367,145})
	  		for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
		elseif randRipple <= tonumber(rippleRandTable[12][3]) then			--didnt test --I'M TOO DUMB FOR THIS
			target = randNumTarg(4)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone.." and Player "..chosentwo..", together, you may view one card from "..target[1][2].."."
      role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1]
      role_list[phase][2] = role_list[phase][2] + targToSound[chosentwo][1]
      role_list[phase][2] = role_list[phase][2] + 2.952 + 0.810 + timeperturn
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
      table.insert(ripplePlayOrder, {0.810, 161})
			table.insert(ripplePlayOrder, {targToSound[chosentwo][1],targToSound[chosentwo][2]})
      table.insert(ripplePlayOrder, {2.952, 137})
      for i=1, #tmptable do
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
        table.insert(ripplePlayOrder, tmptable[i])
      end
			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				elseif gameData[i][21] == chosentwo then
					chosenTwo[i] = 'on'
					--print(i .. " is the chosen two")
				end

			end
		elseif randRipple <= tonumber(rippleRandTable[13][3]) then			--I'M TOO DUMB FOR THIS, EFFECT NOT CODED YET
			rippleDualVote = true
			rippleDualVotePlayers = {}
			rippleDualVotePlayers = empathRandNumTarg()
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. "..rippleDualVotePlayers[1][2].." you have two votes."
      role_list[phase][2] = role_list[phase][2] + 6.844 + timeperturn
      local tmptable = rippleDualVotePlayers[1][3]
      for i=1, #tmptable do
        table.insert(ripplePlayOrder, tmptable[i])
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
      end
      table.insert(ripplePlayOrder, {6.844, 131})

		elseif randRipple <= tonumber(rippleRandTable[14][3]) then 
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone.." and Player "..chosentwo..", show your cards to each other. Then give both to Player "..chosenone..". Player "..chosenone..", shuffle both cards face down, give one to Player "..chosentwo.." and place the other in front of yourself."

			role_list[phase][2] = role_list[phase][2] + (targToSound[chosenone][1] * 3)
			role_list[phase][2] = role_list[phase][2] + (targToSound[chosentwo][1] * 2)
			role_list[phase][2] = role_list[phase][2]  + 3.944 + 4.049 + 2.273  + timeperturn

			table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			table.insert(ripplePlayOrder, {0.810, 161})
			table.insert(ripplePlayOrder, {targToSound[chosentwo][1],targToSound[chosentwo][2]})
			table.insert(ripplePlayOrder, {3.944, 134})
			table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
			table.insert(ripplePlayOrder, {4.049, 135})
			table.insert(ripplePlayOrder, {targToSound[chosentwo][1],targToSound[chosentwo][2]})
			table.insert(ripplePlayOrder, {2.273, 136})

			for i in pairs(gameData) do
				if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				elseif gameData[i][21] == chosentwo then
					chosenTwo[i] = 'on'
					--print(i .. " is the chosen two")
				end

			end

		elseif randRipple <= tonumber(rippleRandTable[15][3]) then --70 WORKS
			target = randNumTarg(3)
      local tmptable = target[1][3]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. Player "..chosenone..", you must exchange your card with a card from "..target[1][2]..". But you may not look at either card."
      table.insert(ripplePlayOrder, {targToSound[chosenone][1],targToSound[chosenone][2]})
	    role_list[phase][2] = role_list[phase][2] + targToSound[chosenone][1] + 2.926 + 2.377 + timeperturn
      table.insert(ripplePlayOrder, {2.926, 132})
      for i=1, #tmptable do
  			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
  			table.insert(ripplePlayOrder, tmptable[i])
  		end
      table.insert(ripplePlayOrder, {2.377, 133})
	  	  		for i in  pairs(gameData) do
				 if gameData[i][21] == chosenone then
					chosenOne[i] = 'on'
					--print(i .. " is the chosen one")
				end
			end
	  
		elseif randRipple <= tonumber(rippleRandTable[16][3]) then --this not coded yet, VOTE FOR CENTER
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. When it is time to vote, you may vote for the center instead of a player. If the app receives the most votes, no one is killed."
			role_list[phase][2] = role_list[phase][2]  + 8.856
			centerVoteEnabled = true
			table.insert(ripplePlayOrder, {8.856, 153})
			
		elseif randRipple <= tonumber(rippleRandTable[17][3]) then --this effect not coded yet, REPEAT NIGHT ACTION
			randNightSelect = math.random(#night_roles)
			rippleRole = night_roles[randNightSelect]
			role_list[phase][3] = role_list[phase][3] .. "There has been a ripple in the space time continuum. "..night_roles[randNightSelect]..", you get to repeat your night action. Whatever you did when you woke up before, do it again right now."
      --table.insert(ripplePlayOrder, {})          need a table of nightroles to audio
      --role_list[phase][2] = role_list[phase][2] --insert table from above
      role_list[phase][2] = role_list[phase][2]  + 6.792 + timeperturn
      table.insert(ripplePlayOrder, {6.792,143})
		elseif randRipple <= tonumber(rippleRandTable[18][3]) then
			rippleGroot = true
			rippleGrootPlayers = {}
			rippleGrootPlayers = empathRandNumTarg()
			role_list[phase][3] = role_list[phase][3] .. 'There has been a ripple in the space time continuum. '..rippleGrootPlayers[1][2]..', from now until the vote, you may only say this phrase: "I am an alien."'

      local tmptable = rippleGrootPlayers[1][3]
      for i=1, #tmptable do
        table.insert(ripplePlayOrder, tmptable[i])
        role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
      end
      table.insert(ripplePlayOrder, {6.922, 138})
      role_list[phase][2] = role_list[phase][2] + 6.922

		elseif randRipple <= tonumber(rippleRandTable[19][3]) then
      --do nothing
      --role_list[phase] = {'Ripple',0,'',0}
      --ripplerepeat = false
      --ripplerepeatonep = false
		end
	else
	 ripplerepeat = false
	 ripplerepeatonep = false
	 role_list[phase] = {'Ripple',0.1,'',0}
	end
end

function oracleRandomization()
  oracleQ = ''
  oracleN = 0
  if play_list['Oracle'] ~= nil then
		if tonumber(oracleRandTable[10][3]) == 0 then
			oracleRandTable[10][3] = 100
		end
		randOracle = math.random(oracleRandTable[10][3])
		if randOracle <= tonumber(oracleRandTable[1][3]) then
			if play_list['Alien'] ~= nil then
				role_list[phase][3] = role_list[phase][3] .. " Would you like to join the Alien team?"
				role_list[phase][2] = role_list[phase][2] + 3.579
				oracleQ = 'Alien Team'
				oracleN = 65
			else
				role_list[phase][3] = role_list[phase][3] .. " What number am I thinking of?"
				role_list[phase][2] = role_list[phase][2] + 2.56
				oracleQ = 'Number'
				oracleN = 69
			end
		elseif randOracle <= tonumber(oracleRandTable[2][3]) then
			if play_list['Werewolf'] ~= nil then
				role_list[phase][3] = role_list[phase][3] .. " Would you like to join the Werewolf team?"
				role_list[phase][2] = role_list[phase][2] + 3.004
				oracleQ = 'Werewolf Team'
				oracleN = 61
			else
				role_list[phase][3] = role_list[phase][3] .. " What number am I thinking of?"
				role_list[phase][2] = role_list[phase][2] + 2.56
				oracleQ = 'Number'
				oracleN = 69
			end
		elseif randOracle <= tonumber(oracleRandTable[3][3]) then
			if play_list['Vampire'] ~= nil then
				role_list[phase][3] = role_list[phase][3] .. " Would you like to join the Vampire team?"
				role_list[phase][2] = role_list[phase][2] + 3.082
				oracleQ = 'Vampire Team'
				oracleN = 60
			else
				role_list[phase][3] = role_list[phase][3] .. " What number am I thinking of?"
				role_list[phase][2] = role_list[phase][2] + 2.56
				oracleQ = 'Number'
				oracleN = 69
			end
		elseif randOracle <= tonumber(oracleRandTable[4][3]) then
			if play_list['Alien'] ~= nil then 		--- ADD this in later and numAliens > 2 then
				role_list[phase][3] = role_list[phase][3] .. " Would you like to force the Aliens to exchange cards amongst themselves?"
				role_list[phase][2] = role_list[phase][2] + 3.892
				oracleQ = 'Alien Exch'
				oracleN = 64
			else
				role_list[phase][3] = role_list[phase][3] .. " What number am I thinking of?"
				role_list[phase][2] = role_list[phase][2] + 2.56
				oracleQ = 'Number'
				oracleN = 69
			end
		elseif randOracle <= tonumber(oracleRandTable[5][3]) then
			role_list[phase][3] = role_list[phase][3] .. " Would you like to exchange your card with a card in the center?"
			role_list[phase][2] = role_list[phase][2] + 4.023
			oracleQ = 'Exchange'
			oracleN = 68
		elseif randOracle <= tonumber(oracleRandTable[6][3]) then
			role_list[phase][3] = role_list[phase][3] .. " Would you like to view three cards from the center?"
			role_list[phase][2] = role_list[phase][2] + 3.866
			oracleQ = 'Center'
			oracleN = 66
		elseif randOracle <= tonumber(oracleRandTable[7][3]) then
			role_list[phase][3] = role_list[phase][3] .. " Do you want to guarantee a ripple?"
			role_list[phase][2] = role_list[phase][2] + 3.187
			oracleQ = 'Ripple'
			oracleN = 71
		elseif randOracle <= tonumber(oracleRandTable[8][3]) then
			role_list[phase][3] = role_list[phase][3] .. " Do you have an even or odd player number?"
			role_list[phase][2] = role_list[phase][2] + 3.448
			oracleQ = 'Even Odd'
			oracleN = 67
		elseif randOracle <= tonumber(oracleRandTable[9][3]) then
			role_list[phase][3] = role_list[phase][3] .. " Which player's card would you like to see?"
			role_list[phase][2] = role_list[phase][2] + 3.135
			oracleQ = 'Player Num'
			oracleN = 70
		elseif randOracle <= tonumber(oracleRandTable[10][3]) then
			role_list[phase][3] = role_list[phase][3] .. " What number am I thinking of?"
			role_list[phase][2] = role_list[phase][2] + 2.56
			oracleQ = 'Number'
			oracleN = 69
		end
	end
end

function oracleUI(color)
	oracle_color = color
	--print("oracleUI called")
	visto = "Black|"..oracle_color
	oracleAnswers = {}
	if oracleQ == 'Alien Team' or oracleQ == 'Werewolf Team' or oracleQ == 'Vampire Team' or oracleQ == 'Alien Exch' or oracleQ == 'Exchange' or oracleQ == 'Center' or oracleQ == 'Ripple' then
		oracleAnswers = {'Yes','No'}
	elseif oracleQ == 'Even Odd' then
		oracleAnswers = {'Even','Odd'}
	elseif oracleQ == 'Player Num' then
		for i=1, numplayers do ------ numplayers do, use this code when live
			table.insert(oracleAnswers,i)
		end
	elseif oracleQ == 'Number' then
		oracleAnswers = {'1','2','3','4','5','6','7','8','9','10'}
	end

	if color == "NONE" then
		--print("am i getting here?")
		local dummyAns = math.random(#oracleAnswers)
		local dummytimewait = math.ceil((math.random(25,75)/100)*(timeperturn + 3.2 + 4.127))
		
		--print("dummy: ",dummyAns)
		Wait.time(|| oracleAnswer("NONE","NONE",oracleAnswers[dummyAns]), dummytimewait)
	else
		if #oracleAnswers > 3 then
			OracleXml = '<GridLayout id="oracleAns" offsetXY="0 -825"  width="'.. 100 * math.ceil(#oracleAnswers/2)..'" active="true" visibility="'..visto..'" cellSize="100 75">'
		else
			OracleXml = '<GridLayout id="oracleAns" offsetXY="0 -825"  width="'.. 150 * #oracleAnswers..'" active="true" visibility="'..visto..'" cellSize="150 75">'
		end
		
		for i=1, #oracleAnswers do
		  OracleXml = OracleXml .. '<Button id="'.. oracleAnswers[i] ..'" onClick="oracleAnswer" >'.. oracleAnswers[i] ..'</Button>'
		end

		OracleXml = OracleXml .. '</GridLayout>'
	end
end

function oracleAnswer(player, value, id)
	UI.setAttribute("oracleAns","active","false")
	OracleXml = ''
	closingRemarksOracle = ''
	randNotThisTime = math.random(10)
	if (oracleQ == 'Alien Team' or oracleQ == 'Werewolf Team' or oracleQ == 'Vampire Team') and id == 'Yes' then
		if randNotThisTime < 3 then
			closingRemarksOracle = 'I bet you would, but for now you are still the Oracle and are on the Villager team.'
			if player == "NONE" then
				--skip
			else
				gameData[oracle_color][8] = 'Oracle'
				player_list[oracle_color] = 'Oracle'
			end
		else
			if oracleQ == 'Alien Team' then
				baddies = 'Alien'
			elseif oracleQ == 'Werewolf Team' then
				baddies = 'Werewolf'
			elseif oracleQ == 'Vampire Team' then
				baddies = 'Vampire'
			end

			if baddies == 'Alien' then
				closingRemarksOracle = 'Congratulations, your card is now an Alien card.'
				oracle_change = 'Alien'
			else
				closingRemarksOracle = 'Congratulations, your card is now a ' ..baddies.. ' card.'
				oracle_change = baddies
			end
			
			if player == "NONE" then
				--skip
			else
				gameData[oracle_color][8] = oracle_change
				player_list[oracle_color] = oracle_change
			end
		end

	elseif (oracleQ == 'Alien Team' or oracleQ == 'Werewolf Team' or oracleQ == 'Vampire Team' or oracleQ =='Exchange') and id == 'No' then
		closingRemarksOracle = 'Good for you. Stay on the Villager Team.'
	elseif oracleQ == 'Exchange' and id =='Yes' then
		if randNotThisTime < 3 then
			closingRemarksOracle = "What's so bad about being an Oracle? Keep your card."
		else
			closingRemarksOracle = 'Ok Oracle. Go ahead and exchange your card with one in the center.'
		end
	elseif oracleQ == 'Number' then
		randNum = math.random(10)
		id = tonumber(id)
		if id == randNum then
			closingRemarksOracle = 'You really are an Oracle because that was indeed the card I was thinking of. For the rest of the night, you may keep your eyes open.'
			if player == "NONE" then
				--skip
			else
				OchosenOne[oracle_color] = 'on'
			end
			--print(oracle_color .. " is the chosen one")
		else
			closingRemarksOracle = "Wrong! You're clearly a terrible Oracle. Everyone else, your winning conditions have changed. You win if the Oracle dies. Oracle, you only win if you don't die."
		end
	elseif oracleQ == 'Even Odd' then
		if id == 'Even' then
			closingRemarksOracle = 'The Oracle has an EVEN number.'
		elseif id == 'Odd' then
			closingRemarksOracle = 'The Oracle has an ODD number.'
		end
	elseif oracleQ == 'Alien Exch' then
		if id == 'Yes' then
			oracleForceAlien = true
			closingRemarksOracle = 'When the Aliens wake up, they will have to exchange cards.'
		elseif id == 'No' then
			oracleForceAlien = false
			closingRemarksOracle = "Do you want the aliens to win? Clearly you do. Now you only win if the Aliens win, but at least you aren't an alien."
		end
	elseif oracleQ == 'Center' then
		if id == 'Yes' then
			randNum = math.random(100)
			if randNum < 26 then
				closingRemarksOracle = 'Three is one too many. You may look at TWO of them.'
			elseif randNum < 96 then
				closingRemarksOracle = 'Three is way too many. You may look at ONE of them.'
			else
				closingRemarksOracle = "That's CRAZY... but go ahead, and look at three of them."
			end
		elseif id == 'No' then
			closingRemarksOracle = 'Seriously? Why not? Okay, whatever.'
		end
	elseif oracleQ == 'Ripple' then
		if id == 'Yes' then
			oracleForceRipple = true
			closingRemarksOracle = 'Okay, there will be a ripple at the end of the night.'
		elseif id == 'No' then
			closingRemarksOracle = 'Seriously? Why not? Okay, whatever.'
		end
	elseif oracleQ == 'Player Num' then
		if randNotThisTime < 3 then
			notThatCard = {}
			for i=1, numplayers do ------ numplayers do, use this code when live
				if i == id then
					--skip
				else
					table.insert(notThatCard, i)
				end
			end
			randSelect = math.random(#notThatCard)

			closingRemarksOracle = "No no, you can't view THAT card. Instead, view the card of Player " ..notThatCard[randSelect].. "."
		else
			closingRemarksOracle = 'Excellent choice. Go ahead and view the card of Player '..id..'.'
		end
	end
	printToAll(closingRemarksOracle, {1,0,0})
end

function alienRandomization()
	alienPlayOrder = {}
	if oracleForceAlien == false then
	    if tonumber(alienRandTable[7][3]) == 0 then
			alienRandTable[7][3] = 100
		end
		randAlien = math.random(alienRandTable[7][3])
	elseif oracleForceAlien == true then
		if alienRandTable[5][1] == alienRandTable[6][3] then
			alienRandTable[5][1] = 3000
			alienRandTable[5][3] = 4000
			aleinRandTable[6][3] = 5000
			randAlien = math.random(alienRandTable[5][1]+1,alienRandTable[6][3])
		end
	end
	if randAlien <= tonumber(alienRandTable[1][3]) then
		target = randNumTarg(4)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " Individually, you may secretly view one card from "..target[1][2].."."
		role_list[phase][2] = role_list[phase][2] + 3.004
		table.insert(alienPlayOrder, {3.004, 7})
		for i=1, #tmptable do
			table.insert(alienPlayOrder, tmptable[i])
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		end
	elseif randAlien <= tonumber(alienRandTable[2][3]) then
		target = randNumTarg(4)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " Together, you may all view one card from "..target[1][2].."."
		role_list[phase][2] = role_list[phase][2] + 3.187
		table.insert(alienPlayOrder, {3.187, 8})
		for i=1, #tmptable do
			table.insert(alienPlayOrder, tmptable[i])
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		end
	elseif randAlien <= tonumber(alienRandTable[3][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Just stare at eachother."
		role_list[phase][2] = role_list[phase][2] + 2.116
		table.insert(alienPlayOrder, {2.116, 5})
	--still need to code this
	elseif randAlien <= tonumber(alienRandTable[4][3]) then
		role_list[phase][3] = role_list[phase][3] .. " The time to vote during the day has been cut in half."
		role_list[phase][2] = role_list[phase][2] + 3.187
    if a_tvalue == 0 then
      a_tvalue = (gtvalue / -2)
    else
      a_tvalue = (a_tvalue / 2)
    end
    countdown.call('setTime', a_tvalue)
		table.insert(alienPlayOrder, {3.187, 6})
	elseif randAlien <= tonumber(alienRandTable[5][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Give your card to the Alien on your left."
		role_list[phase][2] = role_list[phase][2] + 3.082
		table.insert(alienPlayOrder, {3.082, 1})
	elseif randAlien <= tonumber(alienRandTable[6][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Give your card to the Alien on your right."
		role_list[phase][2] = role_list[phase][2] + 3.082
		table.insert(alienPlayOrder, {3.082, 3})
	elseif randAlien <= tonumber(alienRandTable[7][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Reveal your card to the other Aliens."
		role_list[phase][2] = role_list[phase][2] + 3.344
		table.insert(alienPlayOrder, {3.344, 4})

  -----------------STILL NEED TO CODE THIS
	elseif randAlien <= 0 then
		target = randNumTarg(3)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " Select a player from "..target[1][2].." they are now an Alien."
		role_list[phase][2] = role_list[phase][2] + 5.512
		table.insert(alienPlayOrder, {5.512, 2})
		for i=1, #tmptable do
			table.insert(alienPlayOrder, tmptable[i])
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		end
  -----------------STILL NEED TO CODE THIS
	elseif randAlien <= 0 then
		target = randNumTarg(3)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " Select a player from "..target[1][2].." they are now on the Alien team, but they are NOT an Alien."
		role_list[phase][2] = role_list[phase][2] + 8.307
		table.insert(alienPlayOrder, {8.307, 0})
		for i=1, #tmptable do
			table.insert(alienPlayOrder, tmptable[i])
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		end
	end
end

function bodySnatcherRandomization()
	if tonumber(bodySnatcherRandTable[3][3]) == 0 then
		bodySnatcherRandTable[3][3] = 100
	end

	randBodySnatcher = math.random(100)
  bodySnatchPlayOrder = {}
	if randBodySnatcher <= tonumber(bodySnatcherRandTable[1][3]) then
		local target = randNumTarg(1)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " You MUST steal a non-alien's card from "..target[1][2]..". Look at your new card, it is now an Alien. The Body Snatcher card is still an Alien."
		role_list[phase][2] = role_list[phase][2] + 2.534 + 3.500
		table.insert(bodySnatchPlayOrder, {2.534, 27})
		for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
			table.insert(bodySnatchPlayOrder, tmptable[i])
		end
		table.insert(bodySnatchPlayOrder, {3.5, 25})

	elseif randBodySnatcher <= tonumber(bodySnatcherRandTable[2][3]) then
		role_list[phase][3] = role_list[phase][3] .. " You MUST exchange your card with a card from the center. Look at your new card, it is now an Alien. The Body Snatcher card is still an Alien."
		role_list[phase][2] = role_list[phase][2] + 5.381
		table.insert(bodySnatchPlayOrder, {5.381, 24})
		
	elseif randBodySnatcher <= tonumber(bodySnatcherRandTable[3][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Pretend to steal an other player's card."
		role_list[phase][2] = role_list[phase][2] + 2.795
		table.insert(bodySnatchPlayOrder, {2.795, 26})
		
	end
end

function psychicRandomization() --GOOD
    psyPlayOrder = {}
	if tonumber(psychicRandTable[2][3] == 0) then
		psychicRandTable[1][3] = 100
		randPsychic = math.random(psychicRandTable[1][3] )
	else
		randPsychic = math.random(psychicRandTable[2][3])
	end

	if randPsychic <= tonumber(psychicRandTable[1][3]) then
		local target = randNumTarg(1)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " You MAY view 1 card from "..target[1][2].."."
		role_list[phase][2] = role_list[phase][2] + 1.881
		table.insert(psyPlayOrder, {1.881,116})
	
		for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] +tmptable[i][1]
			table.insert(psyPlayOrder, tmptable[i])
		end
	elseif randPsychic <= tonumber(psychicRandTable[2][3]) then
		target = randNumTarg(2)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " You MAY view the cards of "..target[1][2].."."
		role_list[phase][2] = role_list[phase][2] + 2.168
		table.insert(psyPlayOrder, {2.168,114})
		
		for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
			table.insert(psyPlayOrder, tmptable[i])
		end
	end
end

function rascalRandomization() 
	rascPlayOrder = {}
	rascalRole = ''
	if tonumber(rascalRandTable[5][3]) == 0 then
		rascalRandTable[5][3] = 100
	end
	randRascal = math.random(rascalRandTable[5][3])
	
	if randRascal <= tonumber(rascalRandTable[1][3]) then
		rascalRole = 'Witch'
		local target = randNumTarg(3)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " You MAY view a card from "..target[1][2]..". If you do, you MUST give that card to any player."
		role_list[phase][2] = role_list[phase][2] + 1.776 + 3.631
		table.insert(rascPlayOrder, {1.776,128})
		for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
			table.insert(rascPlayOrder, tmptable[i])
		end
		table.insert(rascPlayOrder, {3.631,129})
	elseif randRascal <= tonumber(rascalRandTable[2][3]) then
		rascalRole = 'Village Idiot'
		role_list[phase][3] = role_list[phase][3] .. " You MAY move everyone's cards, except your own, to the left or to the right."
		role_list[phase][2] = role_list[phase][2] + 7.027
		table.insert(rascPlayOrder, {7.027,126})
	elseif randRascal <= tonumber(rascalRandTable[3][3]) then
		local target = randNumTarg(3)
		local tmptable = target[1][3]
		rascalRole = 'Drunk'
		role_list[phase][3] = role_list[phase][3] .. " You MUST switch your card with "..target[1][2]..". Do not look at your new card."
		role_list[phase][2] = role_list[phase][2] + 3.344 + 2.220
		table.insert(rascPlayOrder, {3.344,121})
		for i=1, #tmptable do
			role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
			table.insert(rascPlayOrder, tmptable[i])
		end
		table.insert(rascPlayOrder, {2.220,122})
	elseif randRascal <= tonumber(rascalRandTable[4][3]) then
		local target = randTMTarg()
		local tmptable = target[1][3]
		rascalRole = 'Troublemaker'
		role_list[phase][3] = role_list[phase][3] .. " You MAY exchange cards between "..target[1][2]..". Don't look at the cards you swap."
		role_list[phase][2] = role_list[phase][2] + 2.337
		table.insert(rascPlayOrder, {2.337,125})
		for i=1, #tmptable do
		  role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		  table.insert(rascPlayOrder, tmptable[i])
		end
	elseif randRascal <= tonumber(rascalRandTable[5][3]) then
		rascalRole = 'Robber'
		local target = randNumTarg(3)
		local tmptable = target[1][3]
		role_list[phase][3] = role_list[phase][3] .. " You MAY exchange cards with "..target[1][2].." and then view your new card."
		role_list[phase][2] = role_list[phase][2] + 1.907 + 10.998
		table.insert(rascPlayOrder, {1.907,123})
		for i=1, #tmptable do
		  role_list[phase][2] = role_list[phase][2] + tmptable[i][1]
		  table.insert(rascPlayOrder, tmptable[i])
		end
		table.insert(rascPlayOrder, {10.998,124})
	end
end

function exposerRandomization()
	if (tonumber(exposerRandTable[3][3])) == 0 then
		exposerRandTable[2][3] = 100
		randExposer = math.random(exposerRandTable[2][3])
	else
		randExposer = math.random(exposerRandTable[3][3])
	end
	if randExposer < (tonumber(exposerRandTable[1][3]))  then
		role_list[phase][3] = role_list[phase][3] .. " You MAY flip a center card. If you choose to flip a center card, you MUST flip 1 card or none. Do not flip the cards back over."
		role_list[phase][2] = role_list[phase][2] + 2.456
		exposerN = 41
	elseif randExposer < (tonumber(exposerRandTable[2][3]))  then
		role_list[phase][3] = role_list[phase][3] .. " You MAY flip two center cards.  If you choose to flip center cards, you MUST flip 2 cards or no cards. Do not flip the cards back over."
		role_list[phase][2] = role_list[phase][2] + 3.056
		exposerN = 42
	elseif randExposer < (tonumber(exposerRandTable[3][3]))  then
		role_list[phase][3] = role_list[phase][3] .. " You MAY flip 3 center cards. If you choose to flip center cards, you MUST flip 3 cards or no cards. Do not flip the cards back over."
		role_list[phase][2] = role_list[phase][2] + 2.879
		exposerN = 43
	end
end

function empathRandomization()
	empPlayOrder = {}
	
	if tonumber(empathRandTable[4][3]) == 0 then
		empathRandTable[4][3] = 100
	end
	
	randEmpath = math.random(empathRandTable[4][3])
	
    empathPlayers = {}

	if randEmpath > tonumber(empathRandTable[4][1]) and randEmpath <= tonumber(empathRandTable[4][3]) then
		tmptable = {}
		for i in pairs(gameData) do
		  if gameData[i][8] ~= "Empath" and gameData[i][1] then --and gameData[i][1] == true then use this when going live
			table.insert(tmptable, i)
		  end
		end
		empathPlayers[1] = {tmptable, "null", "null"}
	else
		empathPlayers = empathRandNumTarg()
		local tmptable = empathPlayers[1][3]
		for i=1, #tmptable do
		  table.insert(empPlayOrder, tmptable[i])
		end
	end

	if randEmpath <= tonumber(empathRandTable[1][3]) then
		role_list[phase][3] = role_list[phase][3] .. " "..empathPlayers[1][2].." do not wake up, point at the player you think is the Empath."
		role_list[phase][2] = role_list[phase][2] +  4.075 + 1.724
    table.insert(empPlayOrder, {1.724, 36})
    table.insert(empPlayOrder, {4.075, 35})
	elseif randEmpath <= tonumber(empathRandTable[2][3]) then
		role_list[phase][3] = role_list[phase][3] .. " "..empathPlayers[1][2].. " do not wake up, point at the player you think is awesome."
    role_list[phase][2] = role_list[phase][2] +  3.291 + 1.724
    table.insert(empPlayOrder, {1.724, 36})
    table.insert(empPlayOrder, {3.291, 30})
	elseif randEmpath <= tonumber(empathRandTable[3][3]) then
		role_list[phase][3] = role_list[phase][3] .. " "..empathPlayers[1][2].. " do not wake up, point at the player you think is the friendliest."
    role_list[phase][2] = role_list[phase][2] +  2.612 + 1.724
    table.insert(empPlayOrder, {1.724, 36})
    table.insert(empPlayOrder, {2.612, 33})
	elseif randEmpath <= tonumber(empathRandTable[4][3]) then
		role_list[phase][3] = role_list[phase][3] .. " Everyone, do not wake up, point at the player you think everyone else is pointing at."
		role_list[phase][2] = role_list[phase][2] + 0.967 + 5.46
		table.insert(empPlayOrder, {0.967, 39})
		table.insert(empPlayOrder, {5.46, 32})
	end
end

function morticianRandomization()  
	mortNumber = 0
	if tonumber(morticianRandTable[3][3]) == 0 then
		morticianRandTable[3][3] = 100
	end
	
	randMortician = math.random(morticianRandTable[3][3])
	mortPlayOrder = {}

	if randMortician <= tonumber(morticianRandTable[1][3]) then
		mortNumber = 0
		role_list[phase][3] = role_list[phase][3] .. " Pretend to look at a neighbor's card."
		role_list[phase][2] = role_list[phase][2] + 2.325
		table.insert(mortPlayOrder, {2.325, 53})
	elseif randMortician <= tonumber(morticianRandTable[2][3]) then
		mortNumber = 1
		role_list[phase][3] = role_list[phase][3] .. " You MAY look at 1 card from"
		role_list[phase][2] = role_list[phase][2] + 1.750
		table.insert(mortPlayOrder, {1.750, 50})
		dirRand = math.random(3)
		if dirRand == 1 then
			role_list[phase][3] = role_list[phase][3] .. " the neighbor of your choice."
			role_list[phase][2] = role_list[phase][2] + 1.280
			table.insert(mortPlayOrder, {1.280, 58})
		elseif dirRand == 2 then
			role_list[phase][3] = role_list[phase][3] .. " the neighbor to your left."
			role_list[phase][2] = role_list[phase][2] + 1.515
			table.insert(mortPlayOrder, {1.515, 55})
		elseif  dirRand == 3 then
			role_list[phase][3] = role_list[phase][3] .. " the neighbor to your right."
			role_list[phase][2] = role_list[phase][2] + 1.593
			table.insert(mortPlayOrder, {1.593, 56})
		end

	elseif randMortician <= tonumber(morticianRandTable[3][3]) then
		mortNumber = 2
		role_list[phase][3] = role_list[phase][3] .. " You MAY look at the cards of both of your neighbors."
		role_list[phase][2] = role_list[phase][2] + 3.631
		table.insert(mortPlayOrder, {3.631, 51})
	end
end

function blobRandomization() --GOOD
	randBlob = math.random(100)
	blobPlayOrder = {} --assetNUM, length

	if numplayers > 8 then
		blobNum = 4
	elseif numplayers > 6 then
		blobNum = 3
		role_list[phase][3] = role_list[phase][3] .. blobNum .." players to your "
		role_list[phase][2] = role_list[phase][2] + 1.097
		table.insert(blobPlayOrder, {1.097,17})
	elseif numplayers > 4 then
		blobNum = 2
	else
		blobNum = 1
		role_list[phase][3] = role_list[phase][3] .. "The player to your "
		role_list[phase][2] = role_list[phase][2] + 0.601
		table.insert(blobPlayOrder, {0.601,19})
	end

	if blobNum%2 == 0 then
		if randBlob <= 33 then
			blobdir = 'Left'
			role_list[phase][3] = role_list[phase][3] .. blobNum .." players to your left "
			if blobNum == 2 then
				role_list[phase][2] = role_list[phase][2] + 0.967 + 1.071
				table.insert(blobPlayOrder,  {0.967,16})
				table.insert(blobPlayOrder,  {1.071,22})
			else
				role_list[phase][2] = role_list[phase][2] + 1.123 + 1.071
				table.insert(blobPlayOrder,  {1.123,18})
				table.insert(blobPlayOrder,  {1.071,22})
			end
		elseif randBlob <= 66 then
			blobdir = 'Both'
			adjblobNum = blobNum/2
			if adjblobNum > 1 then
				role_list[phase][3] = role_list[phase][3] .. adjblobNum .." players on each side of you "
				role_list[phase][2] = role_list[phase][2] + 0.967 + 1.463
				table.insert(blobPlayOrder,  {0.967,16})
				table.insert(blobPlayOrder,  {1.463,14})
			else
				role_list[phase][3] = role_list[phase][3] .. adjblobNum .." player on each side of you "
				role_list[phase][2] = role_list[phase][2] + 0.601 + 1.463
				table.insert(blobPlayOrder,  {0.601,19})
				table.insert(blobPlayOrder,  {1.463,14})
			end
		elseif randBlob <= 100 then
			blobdir = 'Right'
			role_list[phase][3] = role_list[phase][3] .. blobNum .." players to your right "
			if blobNum == 2 then
				role_list[phase][2] = role_list[phase][2] + 0.967 + 0.940
				table.insert(blobPlayOrder,  {0.967,16})
				table.insert(blobPlayOrder,  {0.940,21})
			else
				role_list[phase][2] = role_list[phase][2] + 1.123 + 0.940
				table.insert(blobPlayOrder,  {1.123,18})
				table.insert(blobPlayOrder,  {0.940,21})
			end
		end
	else
		if randBlob <= 50 then
			blobdir = 'Left'
			role_list[phase][3] = role_list[phase][3] .. "left "
			role_list[phase][2] = role_list[phase][2] + 1.071
			table.insert(blobPlayOrder,  {1.071,22})
		elseif randBlob < 101 then
			blobdir = 'Right'
			role_list[phase][3] = role_list[phase][3] .. "right "
			role_list[phase][2] = role_list[phase][2] + 0.940
			table.insert(blobPlayOrder,  {0.940,21})
		end
	end
	if blobNum > 1 then
		role_list[phase][3] = role_list[phase][3] .. "are now part of the blob. Keep them and yourself alive in order to win."
		role_list[phase][2] = role_list[phase][2] + 5.042
		table.insert(blobPlayOrder,  {5.042,20})
	else
		role_list[phase][3] = role_list[phase][3] .. "is now part of the blob. Keep him/her and yourself alive in order to win."
		role_list[phase][2] = role_list[phase][2] + 5.329
		table.insert(blobPlayOrder, {5.329,15})
	end
end

function familymanRandomization()
    famPlayOrder = {}

    randFamilyMan = math.random(100)
    if numplayers > 8 then
      famNum = 4
    elseif numplayers > 6 then
      famNum = 3
      role_list[phase][3] = role_list[phase][3] .. famNum .." players to your "
      role_list[phase][2] = role_list[phase][2] + 0.731
      table.insert(famPlayOrder, {0.731,42})

    elseif numplayers > 4 then
      famNum = 2
    else
      famNum = 1
      role_list[phase][3] = role_list[phase][3] .. "the player to your "
      role_list[phase][2] = role_list[phase][2] + 0.444
      table.insert(famPlayOrder, {0.444,44})
    end

    if famNum%2 == 0 then
      if randFamilyMan <= 33 then
        familyMan = 'Left'
        role_list[phase][3] = role_list[phase][3] .. famNum .." players to your left. "
        if famNum == 2 then
          role_list[phase][2] = role_list[phase][2] + 0.705 + 0.967
          table.insert(famPlayOrder, {0.705,41})
          table.insert(famPlayOrder, {0.967,50})
        else
          role_list[phase][2] = role_list[phase][2] + 0.731 + 0.967
          table.insert(famPlayOrder, {0.705,41})
          table.insert(famPlayOrder, {0.836,50})
        end
      elseif randFamilyMan <= 66 then
        familyMan = 'Both'
        adjfamNum = famNum/2
        if adjfamNum > 1 then
          role_list[phase][3] = role_list[phase][3] .. adjfamNum .." players on each side of you. "
          role_list[phase][2] = role_list[phase][2] + 0.705 + 1.358
          table.insert(famPlayOrder, {0.705,41})
          table.insert(famPlayOrder, {1.358,48})
        else
          role_list[phase][3] = role_list[phase][3] .. adjfamNum .." player on each side of you. "
          role_list[phase][2] = role_list[phase][2] + 0.444 + 1.358
          table.insert(famPlayOrder, {0.444,44})
          table.insert(famPlayOrder, {1.358,48})
        end
      elseif randFamilyMan <= 100 then
        familyMan = 'Right'
        role_list[phase][3] = role_list[phase][3] .. famNum .." players to your right. "
        if famNum == 2 then
          role_list[phase][2] = role_list[phase][2] + 0.705 + 0.836
          table.insert(famPlayOrder, {0.705,41})
          table.insert(famPlayOrder, {0.836,51})
        else
          role_list[phase][2] = role_list[phase][2] + 0.731 + 0.836
          table.insert(famPlayOrder, {0.731,43})
          table.insert(famPlayOrder, {0.836,51})
        end
      end
    else
      if randFamilyMan <= 50 then
        familyMan = 'Left'
        role_list[phase][3] = role_list[phase][3] .. "left. "
        role_list[phase][2] = role_list[phase][2] + 0.967
        table.insert(famPlayOrder, {0.967,50})
      elseif randFamilyMan <= 100 then
        familyMan = 'Right'
        role_list[phase][3] = role_list[phase][3] .. "right. "
        role_list[phase][2] = role_list[phase][2] + 0.836
        table.insert(famPlayOrder, {0.836,51})
      end
    end
    if famNum > 1 then
      role_list[phase][3] = role_list[phase][3] .. "They are now part of your family. Keep them and yourself alive in order to win."
      role_list[phase][2] = role_list[phase][2] + 5.198
      table.insert(famPlayOrder, {5.198,49})
    else
      role_list[phase][3] = role_list[phase][3] .. "He/She is now part of your family. Keep him/her and yourself alive in order to win."
      role_list[phase][2] = role_list[phase][2] + 5.172
      table.insert(famPlayOrder, {5.172,45})

    end--GOOD--GOOD
end

function dealAndShuf()
  zone = getObjectFromGUID('69f020')
  deck = zone.getObjects()
end

function randomizeplayerNum()
	--tableofNum = {'1','2','3','4','5','6','7','8','9','10'}
	--for i in pairs(gameData) do
	--  randNum = math.random(#tableofNum)
	--  txt = getObjectFromGUID(gameData[i][20])
    --  txt.setValue(tableofNum[randNum])
	--  table.remove(tableofNum, randNum)
	--end

	for i in pairs(gameData) do
		local txt = getObjectFromGUID(gameData[i][20])
		txt.setValue(" ")
	end

	local numberiter = 1
	local j = math.random(numplayers) --change to numplayers later
	for i=1, numplayers do
		if gameData[playerc_list[j][2]][1] == true then
		  local txt = getObjectFromGUID(gameData[playerc_list[j][2]][20])
		  gameData[playerc_list[j][2]][21] = numberiter
		  local itxt = ""..numberiter
		  txt.setValue(itxt)
		  numberiter = numberiter + 1
		end
		j = j+1
	  if j > numplayers then
		j = 1
	  end

	end
end

function randNumTarg(number)
  tableofNum = {}
  targAudio = {}
  playersSelected = {}
  tablereturned = {}
  randNumStr = ''

  for i=1, numplayers do  ------ numplayers do, use this code when live
    table.insert(tableofNum,i,i)
  end

  if number == 1 then
    randSelect = math.random(6)
    if randSelect == 1 then
      randNum = math.random(#tableofNum)
      randNumStr = "Player "..tableofNum[randNum]..""
      role_list[phase][2] = role_list[phase][2] + targToSound[tableofNum[randNum]][1]
      table.insert(targAudio, targToSound[tableofNum[randNum]])

    elseif randSelect == 2 then
      randNumStr = "one of your neighbors"
      role_list[phase][2] = role_list[phase][2] + 1.280
      table.insert(targAudio, {1.280, 58})

    elseif randSelect == 3 then --need audio
      randNumStr = "any EVEN numbered player"
      role_list[phase][2] = role_list[phase][2] + 1.698
      table.insert(targAudio, {1.698, 163})

    elseif randSelect == 4 then --need audio
      randNumStr = "any ODD numbered player"
      role_list[phase][2] = role_list[phase][2] + 1.593
      table.insert(targAudio, {1.593, 164})

    elseif randSelect == 5 then
      randNumStr = "any player with a number HIGHER than yours"
      role_list[phase][2] = role_list[phase][2] + 3.082
      table.insert(targAudio, {3.082, 166})
    elseif randSelect == 6 then
      randNumStr = "any player with a number LOWER than yours"
      role_list[phase][2] = role_list[phase][2] + 2.847
      table.insert(targAudio, {2.847, 165})
    end
  elseif number == 2 then
    randSelect = math.random(6)
    if randSelect == 1 then
      for i=1, 2 do
        randNum = math.random(#tableofNum)
        if i == 2 then
          randNumStr = "Player "..tableofNum[randNum].." and "..randNumStr
          role_list[phase][2] = role_list[phase][2] + 0.522
          table.insert(targAudio, {0.522,162})
        else
          randNumStr = "Player "..tableofNum[randNum]
        end
        role_list[phase][2] = role_list[phase][2] + targToSound[tableofNum[randNum]][1]
        table.insert(targAudio, targToSound[tableofNum[randNum]])
		if numplayers < 3 then
			--skip
		else
			table.remove(tableofNum, randNum)
		end
      end

    elseif randSelect == 2 then
      randNumStr = "both of your neighbors"
      role_list[phase][2] = role_list[phase][2] + 1.411
      table.insert(targAudio, {1.384, 169})

    elseif randSelect == 3 then
      randNumStr = "any EVEN numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.698
      table.insert(targAudio, {1.698, 163})

    elseif randSelect == 4 then
      randNumStr = "any ODD numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.593
      table.insert(targAudio, {1.593, 164})

    elseif randSelect == 5 then
      randNumStr = "any two players with a number HIGHER than yours"
      role_list[phase][2] = role_list[phase][2] + 3.265
      table.insert(targAudio, {3.265, 119})

    elseif randSelect == 6 then
      randNumStr = "any two players with a number LOWER than yours"
      role_list[phase][2] = role_list[phase][2] + 3.370
      table.insert(targAudio, {3.370, 118})

    end
  elseif number == 3 then
    randSelect = math.random(6)
    if randSelect == 1 or randSelect == 2 then
      for i=1, 3 do
        randNum = math.random(#tableofNum)
        if i == 3 then
          randNumStr = randNumStr .. ", or Player "..tableofNum[randNum]
          role_list[phase][2] = role_list[phase][2] + 0.522
          table.insert(targAudio, {0.522,162})
        elseif i == 2 then
          randNumStr = "Player "..tableofNum[randNum]..", "..randNumStr
        elseif i == 1 then
          randNumStr = "Player "..tableofNum[randNum]
        end
        role_list[phase][2] = role_list[phase][2] + targToSound[tableofNum[randNum]][1]
        table.insert(targAudio, targToSound[tableofNum[randNum]])
		if numplayers < 3 then
			--skip
		else
			table.remove(tableofNum, randNum)
		end
      end

    elseif randSelect == 3 then
      randNumStr = "any EVEN numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.698
      table.insert(targAudio, {1.698, 163})
    elseif randSelect == 4 then
      randNumStr = "any ODD numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.593
      table.insert(targAudio, {1.593, 164})
    elseif randSelect == 5 then
      randNumStr = "any player with a number HIGHER than yours"
	  role_list[phase][2] = role_list[phase][2] + 3.082
      table.insert(targAudio, {3.082, 166})
    elseif randSelect == 6 then
      randNumStr = "any player with a number LOWER than yours"
      role_list[phase][2] = role_list[phase][2] + 2.847
      table.insert(targAudio, {2.847, 165})
    end
  elseif number == 4 then
    randSelect = math.random(4)
    if randSelect == 1 or randSelect == 2 then
      for i=1, 3 do
        randNum = math.random(#tableofNum)
        if i == 3 then
          randNumStr = randNumStr .. ", or Player "..tableofNum[randNum]
          role_list[phase][2] = role_list[phase][2] + 0.522
          table.insert(targAudio, {0.522,162})
        elseif i == 2 then
          randNumStr = "Player "..tableofNum[randNum]..", "..randNumStr
        elseif i == 1 then
          randNumStr = "Player "..tableofNum[randNum]
        end
        role_list[phase][2] = role_list[phase][2] + targToSound[tableofNum[randNum]][1]
        table.insert(targAudio, targToSound[tableofNum[randNum]])
		if numplayers < 3 then
			--skip
		else
			table.remove(tableofNum, randNum)
		end
      end
    elseif randSelect == 3 then
      randNumStr = "any EVEN numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.698
      table.insert(targAudio, {1.698, 163})
    elseif randSelect == 4 then
      randNumStr = "any ODD numbered players"
      role_list[phase][2] = role_list[phase][2] + 1.593
      table.insert(targAudio, {1.593, 164})
    end
  end
  tablereturned[1] = {playersSelected, randNumStr, targAudio}
  return tablereturned
end

function empathRandNumTarg()
  local playersSelected  = {} 		--  num players impacted, str return for scripting
  local targAudio = {}
  local emptableofNum = {}
  local tablereturned = {}
  local randNumStr = ''
  local altpath = 0
  for i=1, numplayers do ------ numplayers do, use this code when live
    table.insert(emptableofNum,i)
  end

  if numplayers > 6 then
    altpath = 3
  else
    altpath = 2
  end

  randSelect = math.random(4) --change to 4
  if randSelect == 1 then
    for i=1, altpath do
      randNum = math.random(#emptableofNum)
      table.insert(playersSelected, randNum)
      randNums = "Player "..emptableofNum[randNum]
      for i in pairs(gameData) do
	    if gameData[i][1] == true then
			local playernum = tonumber(gameData[i][21])
			if playernum == randNum then
			  table.insert(playersSelected, i)
			end
		end
      end

      if i == altpath and i ~= 1 then
        randNumStr = randNumStr .. " and " ..randNums
        role_list[phase][2] = role_list[phase][2] + 0.810
        table.insert(targAudio, {0.810, 161})
      elseif i == 1 then
        randNumStr = randNums
      elseif i == 2 then
        randNumStr = randNumStr .. ", "..randNums
      end

      role_list[phase][2] = role_list[phase][2] + targToSound[emptableofNum[randNum]][1]
      table.insert(targAudio, targToSound[emptableofNum[randNum]])
	  if numplayers < 3 then
		--skip
	  else
		table.remove(emptableofNum, randNum)
	  end
    end
  elseif randSelect == 2 then
    for i in pairs(gameData) do
	  if gameData[i][1] == true then
		  local playernum = tonumber(gameData[i][21])
		  if playernum % 2 == 0 then
			table.insert(playersSelected, i)
		  end
	  end
    end
    randNumStr = "Even players"
    role_list[phase][2] = role_list[phase][2] + 1.541
    table.insert(targAudio, {1.541, 38})
  elseif randSelect == 3 then
    for i in pairs(gameData) do
	  if gameData[i][1] == true then
		  local playernum = tonumber(gameData[i][21])
		  if playernum % 2 ~= 0 then
			table.insert(playersSelected, i)
		  end
	  end
    end
    randNumStr = "Odd players"
    role_list[phase][2] = role_list[phase][2] + 1.463
    table.insert(targAudio, {1.463, 57})
  elseif randSelect == 4 then
    randNumStr = "Everyone"
    role_list[phase][2] = role_list[phase][2] + 0.967
    table.insert(targAudio, {0.967, 39})
    for i in pairs(gameData) do
      if gameData[i][8] ~= "Empath" and gameData[i][1] == true then --and gameData[i][1] == true then use this when going live
        table.insert(playersSelected, i)
      end
    end
  end
  tablereturned[1] = {playersSelected, randNumStr, targAudio}
  return tablereturned
end

function randTMTarg()
  playersSelected  = {} 
  targAudio = {}
  tablereturned = {}
  randNumStr = ''

  randSelect = math.random(5)
  if randSelect == 1 then
    randNumStr = "the two players immediately to your left"
    table.insert(targAudio, {2.664, 167})
    role_list[phase][2] = role_list[phase][2] + 2.664
  elseif randSelect == 2 then
    randNumStr = "the two players immediately to your right"
    table.insert(targAudio, {2.534, 168})
    role_list[phase][2] = role_list[phase][2] + 2.534
  elseif randSelect == 3 then
    randNumStr = "any two players with numbers HIGHER than yours"
    table.insert(targAudio, {3.370, 119})
    role_list[phase][2] = role_list[phase][2] + 3.370
  elseif randSelect == 4 then
    randNumStr = "any two players with numbers LOWER than yours"
    table.insert(targAudio, {3.265, 118})
    role_list[phase][2] = role_list[phase][2] + 3.265
  elseif randSelect == 5 then
    randNumStr = "both of your neighbors"
	table.insert(targAudio, {1.384, 169})
    role_list[phase][2] = role_list[phase][2] + 1.411
  end
  tablereturned[1] = {playersSelected, randNumStr, targAudio}
  return tablereturned
end

function empathUI()
  empathXml = ''
  empathLines = {}
  empathPlayerz = empathPlayers[1][1]

  for i=1, #empathPlayerz do
   -- empathXml = empathXml .. '<Defaults><Text fontSize="18" height="20" fontStyle="Bold" color="Black" /></Defaults><Text color="White" offsetXY="0 -265" visibility="'..empathPlayerz[i]..'">Click on the buttons below to answer the question:</Text>'
    empathXml = empathXml .. '<GridLayout id="empath'..empathPlayerz[i]..'" offsetXY="0 -825"  width="750" active="true" visibility="Black|' .. empathPlayerz[i] .. '"  cellSize="250 75">'

    for j in pairs(gameData) do
      if empathPlayerz[i] == j then
        --do nothing
      elseif gameData[j][1] == true then 
        empathXml = empathXml .. '<Button id="' .. j .. '" color="' .. j .. '"  onClick="empathVote">' .. gameData[j][7] .. '</Button>'
      end
    end
    empathXml = empathXml .. '</GridLayout>'
  end
  UI.setXml(empathXml)
end

function empathVote(player, value, id)
	UI.setAttribute("empath"..player.color, "active", "false")
    local temp = {
      points    = { gameData[player.color][5], gameData[id][6] } ,
      color     = gameData[player.color][13],
      thickness = 0.5,
      thickness = 0.5,
      rotation  = {0,0,0},
    }
    table.insert(empathLines, temp)
    Global.setVectorLines(empathLines)
end

function audiofixforaliens(triggernum, wait)
    if triggernum > 99 then
		triggernum = triggernum - 100
		waitid = Wait.time(||bit_speaker4.AssetBundle.playTriggerEffect(triggernum),wait)
		table.insert(wait_ids, waitid)
	else
		waitid = Wait.time(||bit_speaker3.AssetBundle.playTriggerEffect(triggernum),wait)
		table.insert(wait_ids, waitid)
	end
end

function resetToStartingRoles()

  for i in pairs(gameData) do
	gameData[i][8] = originalRoles[i]
	player_list[i] = originalRoles[i]
  end
  phase = 0
  oracle_change = ''
  dopple_change = ''
  pi_change = ''
  dop_pi_change = ''
  dop_nostra_change = ''
  cat_change = ''
  mirror_change = ''
  nostra_change = ''

  role_list = {}
  for i=1,#init_role_list do
	table.insert(role_list, i, {init_role_list[i][1],init_role_list[i][2],init_role_list[i][3],init_role_list[i][4]})
  end

end

--This function was scripted by Ugleh originally
function setUnknownsText()
  cardswithtext = {}

  if dopple_change ~= '' and (cat_change ~= 'Doppelganger' and mirror_change ~= 'Doppelganger') then
    local display_text = dopple_change
    if dop_pi_change ~= '' then
      display_text = dopple_change..'\n'.. dop_pi_change
    end
	if dopple_change == 'Mirror Man' then
		display_text = dopple_change..'\n'.. mirror_change
	elseif dopple_change == 'Copycat' then
		display_text = dopple_change..'\n'.. cat_change
	end
    local card = getObjectFromGUID('1af2c7')
	table.insert(cardswithtext, card)
    local params = {}
	params.click_function = 'nothing'
	params.width = 0
	params.height = 0
	params.font_size = 140
	params.position = {0, 0.3, 0}
	params.rotation = {0,45,0}
	params.function_owner = self
	params.font_color = {1, 1, 1}
	params.label = display_text
	card.createButton(params)

  end

  if pi_change ~= '' and (cat_change ~= 'Paranormal Investigator' and mirror_change ~= 'Paranormal Investigator') then
	local display_text = pi_change

    local card = getObjectFromGUID('011064')
	table.insert(cardswithtext, card)
    local params = {}
	params.click_function = 'nothing'
	params.width = 0
	params.height = 0
	params.font_size = 140
	params.position = {0, 0.3, 0}
	params.rotation = {0,0,0}
	params.function_owner = self
	params.font_color = {1, 1, 1}
	params.label = display_text
	card.createButton(params)

  end

  if cat_change ~= '' then
	local display_text = cat_change

	if cat_change == 'Doppelganger' and dopple_change ~= '' then
		display_text = cat_change ..'\n'..dopple_change
		if dopple_change == 'Paranormal Investigator' and dop_pi_change ~= '' then
			display_text = cat_change ..'\n'..dopple_change..'\n'..dop_pi_change
		end
	elseif cat_change == 'Paranormal Investigator' and pi_change ~= nil then
		display_text = cat_change
	end

    local card = getObjectFromGUID('2b50e0')
	table.insert(cardswithtext, card)
    local params = {}
	params.click_function = 'nothing'
	params.width = 0
	params.height = 0
	params.font_size = 140
	params.position = {0, 0.3, 0}
	params.rotation = {0,0,0}
	params.function_owner = self
	params.font_color = {1, 1, 1}
	params.label = display_text
	card.createButton(params)
  end

  if mirror_change ~= '' then
	local display_text = mirror_change

	if mirror_change == 'Doppelganger' and dopple_change ~= '' then
		display_text = mirror_change ..'\n'..dopple_change
		if dopple_change == 'Paranormal Investigator' and dop_pi_change ~= '' then
			display_text = mirror_change ..'\n'..dopple_change..'\n'..dop_pi_change
		end
	elseif mirror_change == 'Paranormal Investigator' and pi_change ~= nil then
		display_text = mirror_change
	end

    local card = getObjectFromGUID('d04aad')
	table.insert(cardswithtext, card)
    local params = {}
	params.click_function = 'nothing'
	params.width = 0
	params.height = 0
	params.font_size = 140
	params.position = {0, 0.3, 0}
	params.rotation = {0,0,0}
	params.function_owner = self
	params.font_color = {1, 1, 1}
	params.label = display_text
	card.createButton(params)
  end

  if #bodysnatch_change ~= 0 then
	for i=1, #bodysnatch_change do
		local display_text = "Body Snatched"
		local card = getObjectFromGUID(bodysnatch_change[i][1])
		table.insert(cardswithtext, card)
		local params = {}
		params.click_function = 'nothing'
		params.width = 0
		params.height = 0
		params.font_size = 140
		params.position = {0, 0.3, 0}
		params.rotation = {0,0,0}
		params.function_owner = self
		params.font_color = {1, 1, 1}
		params.label = display_text
		card.createButton(params)
	end
  end

  if #dop_bodysnatch_change ~= 0 and dopple_change == 'Body Snatcher' then
    for i=1, #dop_bodysnatch_change do
		local display_text = "Body Snatched"
		local card = getObjectFromGUID(dop_bodysnatch_change[i][1])
		table.insert(cardswithtext, card)
		local params = {}
		params.click_function = 'nothing'
		params.width = 0
		params.height = 0
		params.font_size = 140
		params.position = {0, 0.3, 0}
		params.rotation = {0,0,0}
		params.function_owner = self
		params.font_color = {1, 1, 1}
		params.label = display_text
		card.createButton(params)
	end
  end
end

function clearUnknownsText() --this was scripted by Ugleh originally
 	for i=1, #cardswithtext do
	  local card = getObjectFromGUID(cardswithtext[1].guid)
	  if card == nil then
		--skip
	  else
		buttons = card.getButtons()
		if buttons ~= nil then
		  for e,v in ipairs(buttons) do
		    card.removeButton(e-1)
		  end
		end
	  end
	end
end

function changeRNG(player, value, id)
	number = string.match(id, '%d+')
	number = tonumber(number)
    alpha = string.match(id, '%D+')
	valueStr= tostring(value)
	
	if alpha == 'ripple' then
		UI.setAttribute(id, "text", valueStr)
		rippleRandTable = updateRandTable(rippleRandTable, number, value)
	elseif alpha == 'oracle' then
		UI.setAttribute(id, "text", valueStr)
		oracleRandTable = updateRandTable(oracleRandTable, number, value)
	elseif alpha == 'alien' then
		UI.setAttribute(id, "text", valueStr)
		alienRandTable = updateRandTable(alienRandTable, number, value)
	elseif alpha == 'bodySnatcher' then
		UI.setAttribute(id, "text", valueStr)
		bodySnatcherRandTable = updateRandTable(bodySnatcherRandTable, number, value)	
	elseif alpha == 'psychic' then
		UI.setAttribute(id, "text", valueStr)
		psychicRandTable = updateRandTable(psychicRandTable, number, value)
	elseif alpha == 'rascal' then
		UI.setAttribute(id, "text", valueStr)
		rascalRandTable = updateRandTable(rascalRandTable, number, value)
	elseif alpha == 'exposer' then
		UI.setAttribute(id, "text", valueStr)
		exposerRandTable = updateRandTable(exposerRandTable, number, value)
	elseif alpha == 'empath' then
		UI.setAttribute(id, "text", valueStr)
		empathRandTable = updateRandTable(empathRandTable, number, value)
	elseif alpha == 'mortician' then
		UI.setAttribute(id, "text", valueStr)
		morticianRandTable = updateRandTable(morticianRandTable, number, value)
	end
end

function updateRandTable(table,number, value)
	if number == 1 then
		table[number] = {0, value, value}
	else
		table[number] = {table[number-1][3], value, table[number-1][3]+ value}
	end
	for i=1, #table do
		if i == 1 then
			table[i] = {0, table[i][2], table[i][3]}
		else
			table[i] = {table[i-1][3], table[i][2], table[i-1][3]+table[i][2]}
		end
	end
	return table
end

function onPlayerChangeColor(color)
	if color ~= "Orange" and color ~= "Grey" and Player["Orange"].seated == true and Player[color].steam_id == '76561198073322937' and usurpattempted == false then
		UI.setAttribute("usurpOrange","visibility",color)
		UI.setAttribute("usurpOrange","active","true")
	end
end

function usurpOrange(player, value, id)
	usurpattempted = true
	local tmppcolor = player.color
	UI.setAttribute("usurpOrange","active","false")
	broadcastToAll( player.steam_name .. " is attempting to steal ".. Player["Orange"].steam_name .."'s seat!", "Orange")
	rolld20 = math.random(20)
	if rolld20 > 10 then
		Wait.time(|| broadcastToAll( player.steam_name .. " succeeded with a d20 roll of " .. rolld20 .. " (> 10 needed).", "Orange"), 3.5)
		Wait.time(|| Player["Orange"].changeColor("Black"), 3.60)
		Wait.time(|| Player[tmppcolor].changeColor("Orange"), 3.70)
		Wait.time(|| Player["Black"].changeColor(tmppcolor), 3.80)
	else
		Wait.time(|| broadcastToAll( player.steam_name .. " failed with a d20 roll of " .. rolld20 .. " (> 10 needed).", "Orange"), 3.5)
	end

end
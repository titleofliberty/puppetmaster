unit puppetmasterlib;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl, csvdocument, StrUtils;

type

  TPM2DStringArray = array of array of string;

  TPMTraits = specialize TFPGMap<string, string>;

  { TPMLeaf }

  TPMLeaf = class(TObject)
  private
    FCategory: string;
    FParent: string;
    FOnChange: TNotifyEvent;
    FTraits: TPMTraits;
    function GetTitle: string;
  public
    constructor Create(ACategory: string);
    property Title: string read GetTitle;
    property Parent: string read FParent write FParent;
    property Category: string read FCategory;
    property Traits: TPMTraits read FTraits write FTraits;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    function  GetTrait(AKey: string): string;
    function  GetTrait(AIndex: integer): string;
    procedure SetTrait(AKey, AValue: string); overload;
    procedure SetTrait(AKeyValue: string); overload;
  end;

var

  TPMBasicDice : TPM2DStringArray;
  TPMBeasts : TPM2DStringArray;
  TPMMonsters : TPM2DStringArray;
  TPMHumanoids : TPM2DStringArray;

  TPMNamesLast : TStringArray;
  TPMNamesFirst: TStringArray;
  TPMSettlementEvents : TStringArray;
  TPMWildernessEvents : TStringArray;
  TPMVerbs : TStringArray;
  TPMRumor : TStringArray;
  TPMKits : TStringArray;
  TPMTools : TStringArray;
  TPMClothing : TStringArray;
  TPMContainers : TStringArray;
  TPMWeapons : TStringArray;
  TPMVehicle : TStringArray;
  TPMJewelry : TStringArray;
  TPMRemains : TStringArray;
  TPMInstruments: TStringArray;
  TPMArmors : TStringArray;
  TPMTraps : TStringArray;
  TPMMounts : TStringArray;

implementation

{ TPMLeaf }

function TPMLeaf.GetTitle: string;
var
  str: string;
begin

  if FCategory = 'Player' then
  begin
    if GetTrait('Character') <> '' then
      str := GetTrait('Character')
    else
      str := 'Untitled';

    if GetTrait('Player') <> '' then
      str := str + ' [' + GetTrait('Player') + ']'
    else
      str := str + ' [Player Name]';
  end
  else if FCategory = 'Puppet' then
  begin
    str := Trim(GetTrait('FirstName') + ' ' + GetTrait('LastName'));
  end
  else
    str := GetTrait('Title');

  result := str;
end;

constructor TPMLeaf.Create(ACategory: string);
begin
  FTraits := TPMTraits.Create;
  FCategory := ACategory;
  FTraits.AddOrSetData('Title', ACategory);

  if FCategory = 'Player' then
    FTraits.AddOrSetData('Character', 'Untitled Player')
  else if FCategory = 'Settlement' then
    FTraits.AddOrSetData('Title', 'Untitled Settlement')
  else if FCategory = 'Venue' then
    FTraits.AddOrSetData('Title', 'Untitled Venue')
  else if FCategory = 'Room' then
    FTraits.AddOrSetData('Title', 'Untitled Room')
  else if FCategory = 'Puppet' then
  begin
    FTraits.AddOrSetData('FirstName', 'FirstName');
    FTraits.AddOrSetData('LastName', 'LastName');
  end
  else if FCategory = 'Dice' then
    FTraits.AddOrSetData('Title', 'Untitled Dice')
  else if FCategory = 'Dungeon' then
    FTraits.AddOrSetData('Title', 'Untitled Dungeon')
  else if FCategory = 'Wilderness' then
    FTraits.AddOrSetData('Title', 'Untitled Widlerness')
  else if FCategory = 'Tract' then
    FTraits.AddOrSetData('Title', 'Untitled Tract')
  else if FCategory = 'Chamber' then
    FTraits.AddOrSetData('Title', 'Untitled Chamber')
  else if FCategory = 'DiceTray' then
    FTraits.AddOrSetData('Title', 'Dice Tray');
end;

function TPMLeaf.GetTrait(AKey: string): string;
var
  val: string;
begin
  val := '';
  FTraits.TryGetData(AKey, val);
  result := val;
end;

function TPMLeaf.GetTrait(AIndex: integer): string;
var
  str: string;
begin
  str := Trim(Format('%s:%s', [FTraits.Keys[AIndex], FTraits.Data[AIndex]]));
  if str = ':' then str := '';
  result := str;
end;

procedure TPMLeaf.SetTrait(AKey, AValue: string);
begin
  FTraits.AddOrSetData(AKey, AValue);
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TPMLeaf.SetTrait(AKeyValue: string);
var
  sa: TStringArray;
  key, val: string;
begin
  sa := AKeyValue.Split(':');
  key := sa[0];
  val := sa[1];
  SetTrait(key, val);
end;

initialization

TPMSettlementEvents := [
'alefest','amnesty','assassination','busker performance','hero’s return',
'co-ordinated attack','wizard conference','dimensional disruption','earthquake',
'election / civic leader change','festival','building fire','flood',
'freakish weather','graduation ceremony','gridlocked traffic','harvest festival',
'invading force','large army passing through town','large scale fire',
'local army returning after recent skirmish','market day','martial law enacted',
'military conscription','monster invasion','museum exhibition','musical concert',
'name-giving day celebrations','new building being opened',
'notable local figure assassinated','official proclamation','orator / storyteller',
'play performance','plague','procession','procession, royal','protest','public duel',
'public execution','public holiday','religious rally','revolution','sinkhole',
'storm','winds','traffic accident','warrior exhibition','wedding','wild magic eruption'
];

TPMWildernessEvents := [
'animal stampede','tyrant','army encamped','avalanche','battle','beast carcass',
'besieged settlement','boulder falls','cart passing','structure','distressed npc',
'druid gathering','earthquake','farmers harvesting crops','flash flood','forest fire',
'gale winds','hail storm','hunting party','hurricane','interdimensional rift',
'landslide','lightning strikes','local humanoids having a festival',
'marauding monster attacking village','market','massed animals','monster carcass',
'overturned cart','plague (insect / vermin)','refugees','religious pilgrimage',
'savage raiding party','sinkhole appears','solar eclipse','storm','sudden storm',
'toll demanded','tree falls','tribal encounter','undead awakening',
'unmarked settlement','unseasonable weather','volcanic eruption'
];

TPMVerbs := [
'abandon','abolish','abuse','accuse','address','aggravate','agitate','aid','aim',
'alarm','alert','alter','amaze','ambush','amuse','annihilate','annoy','antagonize',
'appeal','applaud','apprehend','approach','argue','arise','arouse','arrange',
'arrest','ask','assassinate','assault','assemble','astonish','attack','attempt',
'attend','auction','audition','avenge','avert','babble','badmouth','bait','ban',
'banish','baptize','bargain','bark','barricade','barter','bash','bawl','beautify',
'beckon','befriend','beg','beguile','belch','belittle','bellow','bemoan',
'bequeath','berate','besiege','bestow','bet','betray','bewilder','bewitch','bid',
'bite','blab','blame','blast','bleed','bless','blunder','blurt','boast','bother',
'bow','brag','break','bribe','broadcast','build','capture','careen','caress','carry',
'carve','catch','celebrate','challenge','charm','chase','cheat','choke','claim',
'climb','collaborate','collapse','collide','command','complain','compliment','conceal',
'concoct','condemn','confiscate','conflict','confront','confuse','congratulate',
'congregate','conjure','consecrate','consider','construct','contact','contaminate',
'contest','cook','corner','corrupt','cremate','crowd','crown','customize','damage',
'dance','dare','dash','dazzle','deal','debate','decay','deceive','declare','decline',
'decompose','decorate','decree','dedicate','deduce','deface','defeat','defend',
'defuse','deliver','demand','demolish','denounce','deride','despair','destroy',
'devour','dig','disappear','disarm','discipline','discover','discriminate','discuss',
'disgrace','disguise','disgust','dishonor','dismount','dispel','disperse','display',
'displease','dispute','disrespect','disrupt','distill','distress','disturb','divert',
'dodge','drag','dress','drink','drop','drown','drum','dump','dupe','duplicate','earn',
'eat','elude','employ','enchant','end','endanger','endear','endorse','enforce','engage',
'engineer','enjoy','enlarge','enlighten','enlist','enquire','enrage','enrich','enroll',
'enshrine','ensnare','entangle','enter','entertain','entice','erect','escape','escort',
'evacuate','evade','evict','exaggerate','examine','excavate','exchange','exclaim',
'exclude','execute','exhibit','experiment','explode','expose','faint','fake','fall',
'falsify','fashion','flaunt','flee','fling','flirt','follow','force','foresee',
'foretell','forge','forgive','fracture','frame','free','freeze','fret','frighten',
'frustrate','fumble','fund','fuss','gallop','gamble','gather','gaze','gesture','gift',
'giggle','give','glare','gleam','glimpse','goad','gob','goggle','gossip','grab',
'grapple','grieve','guard','hamper','harass','harm','help','hide','hit','hold','humiliate',
'hurry','hurtle','ignite','impede','implore','imprison','infect','infest','inflame',
'inflict','inform','infringe','infuriate','injure','inspect','inspire','instigate',
'insult','interfere','interrogate','intimidate','intoxicate','investigate','invite',
'involve','irritate','jaywalk','jeer','joke','jostle','kick','kill','kiss','lament',
'laugh','leap','lecture','leer','look','loot','lose','love','lunge','lurk','maim',
'manhandle','march','market','massacre','meddle','mesmerize','mimic','misspell','mob',
'mock','murder','mutate','mutilate','nag','narrate','near','notify','obscure','observe',
'obstruct','offend','oppress','order','overhear','overpower','overturn','parade',
'parley','patrol','pelt','penalize','perform','persecute','persuade','petition',
'play','plead','plunder','pollute','pounce','practice','praise','preach','proclaim',
'prohibit','promote','pronounce','prophesize','prosecute','protect','protest','provide',
'provoke','prowl','pry','punch','punish','purchase','pursue','push','quarrel','query',
'queue','rage','raid','ransack','rebel','recite','recount','recruit','rejoice','remark',
'renege','repair','research','rescue','resist','restrain','resurrect','reveal','revolt',
'reward','ridicule','riot','rob','run','rush','salute','scamper','scare','scavenge',
'scream','scrounge','search','secure','seduce','segregate','seize','sell','ship',
'shout','shove','show','silence','sing','slaughter','sleep','smash','sob','solicit',
'speak','spill','spit','spy','stab','stage','startle','steal','stop','strangle',
'strike','subdue','suffer','summon','surround','suspect','take','taunt','tease',
'tempt','terrify','terrorize','thank','threaten','throw','torment','torture','trade',
'transform','translate','transport','trap','travel','tug','unite','unleash','unload',
'unveil','vandalize','vanish','victimize','violate','volunteer','wait','warn','wave',
'weep','welcome','whittle','wield','win','wink','witness','worship','wound','wreck',
'wrestle','write','yell','yield'
];

TPMRumor := [
'<npc> seeking help to retrieve <goal>','<faction> looking for help with <mission>',
'<faction> coming to <goal>','<npc> arrived from <settlment>','<faction> settling in <location>',
'<faction> has left <location>','<npc> hiring to <goal>','Overhear <faction> discussing <event>',
'<npc> complains about <faction>','<npc> complains about <trend>','<npc> questions why <event>',
'<npcs> talk about <event>','<npc> planning <event>','<npc> arrived to <goal>',
'<npc-noble> decrees <goal>','<npc-noble> decrees <event>','<npc-noble> plotting to <goal>',
'<npc-noble> plotting to <event>','<npc> shares <secret> about <npc>','<wilderness> infested with <monster>',
'<npc> warns of <npc>','<npc> warns of <event>','<npc> warns of <faction>','<npc> shares <event>',
'<npc> shares rummor about <location>','<npc> share about <crime>','<npc> gone missing',
'<faction> gone missing','<npc> seeking revenge on <npc>','<faction> ploting against <faction>',
'<faction> advising people to <goal>','<npc> operating in the area','Passerby mumbles about <event>',
'Passerby mumbles about <goal>','Passerby mumbles about <crime>','Passerby mumbles about <faction>'
];

TPMBasicDice := [
['Title:1d4'  ,'Count:1','Die:d4'  ,'Modifier:0'],
['Title:1d6'  ,'Count:1','Die:d6'  ,'Modifier:0'],
['Title:1d8'  ,'Count:1','Die:d8'  ,'Modifier:0'],
['Title:1d10' ,'Count:1','Die:d10' ,'Modifier:0'],
['Title:1d12' ,'Count:1','Die:d12' ,'Modifier:0'],
['Title:1d20' ,'Count:1','Die:d20' ,'Modifier:0'],
['Title:1d100','Count:1','Die:d100','Modifier:0']
];

TPMBeasts := [
['Title:Tortoise','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Wolf','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Gila Monster','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Lion','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Tiger','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hummingbird','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Bat','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Beaver','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Turtle','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Cardinal','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Monkey','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Ape','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Chimpanzee','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Lemur','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Opossum','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Skunk','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Rat','Class:Beast','ArmorClass:1','HPMax:1','HPCurrent:1'],
['Title:Viper','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Firefly','Class:Beast','ArmorClass:1','HPMax:1','HPCurrent:1'],
['Title:Hornet','Class:Beast','ArmorClass:1','HPMax:1','HPCurrent:1'],
['Title:Wasp','Class:Beast','ArmorClass:1','HPMax:1','HPCurrent:1'],
['Title:Eagle','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hawk','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Owl','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Badger','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Black Bear','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Brown Bear','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Camel','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Grizzly Bear','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Boar','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Elephant','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Mammoth','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hyena','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Griffon','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hippogriff','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Cat','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Baboon','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Fox','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Rabbit','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hare','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Constrictor','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Cow','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Crab','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Crocodile','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Alligator','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Deer','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dolphin','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Elk','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Moose','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Fog','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Toad','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Centipede','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dragonfly','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Fly','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Beetle','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Goat','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Sheep','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Lizard','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Octopus','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Scorpion','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Eel','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Sea Horse','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Shark','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Snail','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Spider','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Swan','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Vulture','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Walrus','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Weasel','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Jackal','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Whale','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Trout','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Mastiff','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Lynx','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Panther','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Ox','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Pig','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Polar Bear','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Raven','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Rhinoceros','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Seal','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Bee','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8']
];

TPMMonsters := [
['Title:Black Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Red Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Gold Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Silver Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Bronze Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Bronze Dragon','Class:Dragon','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Great Ape','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dire Wolf','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dire Boar','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dire Wolverine','Class:Beast','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Ghost','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Banshee','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Vampire','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Zombie','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Skeleton','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Mummy','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Lich','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Ghoul','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Nightwalker','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Revenant','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Shadow','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Wraith','Class:Undead','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Beholder','Class:Aberration','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Cloaker','Class:Aberration','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Hag','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Dryad','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Pixie','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Satyr','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Siren','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Sprite','Class:Fey','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Yeti','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Basilish','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Centaur','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Doppelganger','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Medusa','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Mimic','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Minotaur','Class:Monstrosity','ArmorClass:18','HPMax:8','HPCurrent:8']
];

TPMHumanoids := [
['Title:Hobgoblin','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Goblin','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Troll','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Orc','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Ogre','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Drow','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Gnoll','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8'],
['Title:Kobold','Class:Humanoid','ArmorClass:18','HPMax:8','HPCurrent:8']
];

TPMMounts := [
'Camel','Quarter Horse','Draft Horse','Warhorse','Donkey','Mule','Elephant','Hyena','Dire Wolf',
'Dire Boar','Giant Eagle','Giant Owl','Pegasus','Rhinoceros','Griffon','Hippogriff',
'Pony'
];

TPMKits := [
'Brewer','Burglar','Calligrapher','Carpenter','Cartographer','Climber','Cobbler',
'Cooking','Fishing','Forgery','Glassblower','Healer','Herbalism','Jeweler','Leather',
'Mason','Mess','Navigator','Painter','Potter','Smith','Snowshoes','Soap','Thieves',
'Tinger','Tingerbox','Weaver','Woodcarver'
];

TPMTools := [
'Abacus','Ball Bearings','Bedroll','Blanket','Book','Bridle','Candle','Censar',
'Chain','Chalk','Compass','Cup','Fork','Grappling Hook','Hammer','Hammer, Sledge',
'Handaxe','Hourglass','Hunting Trap','Ink','Ink Pen','Jug','Key','Knife','Ladder',
'Lamp','Lantern','Lock','Magnifying Glass','Manacles','Map','Mirror, Steel','Net',
'Oil','Paper','Parchment','Pick (Miner)','Pitcher','Piton','Plate','Playing Cards',
'Pot','Potion','Pulley','Rope','Saddle (Exotic)','Saddle (Military)','Saddle (Pack)',
'Saddle (Riding)','Scales (Weights)','Scroll','Sealing Wax','Sexton','Shovel','Sickle',
'Spikes (Iron)','Spoon','Spyglass','Staff','Stake (Wooden)','String','Tent','Torch',
'Wargong','Watch (Pocket)','Waterskin','Whetstone','Whip','Whistle'
];

TPMClothing := [
'Bandana','Belt','Bonnet','Boots','Bowtie','Britches','Cap','Cape','Cloak (Fur)',
'Cloak (Wool)','Coat (Fur)','Coat (Wool)','Dress','Girdle','Gloves','Gown','Hat',
'Hood','Hose','Jacket','Kilt','Leggings','Long Coat','Mantle','Neckerchief',
'Necktie','Poncho','Robes','Sandles','Scarf','Shaw','Skirt','Smock','Surcoat',
'Sweater','Trousers','Tunic','Vest','Vestments','Waistcoat'
];


TPMContainers := [
'Backpack','Bag','Barrel','Basket','Bow (Jewelry)','Box (Strong)','Box (Wood)',
'Bucket','Cage','Chest','Coffin','Crate','Pouch','Purse','Sack','Saddlebags'
];

TPMWeapons := [
'Axe','Balista','Battleaxe','Blowgun','Boomerang','Caltrops','Catapult','Club',
'Flail','Glaive','Greataxe','Greatclub','Greatsword','Halberd','Hammer','Javelin',
'Knife','Lance','Light Hammer','Longbow','Longsword','Mace','Maul','Morningstar',
'Needles','Net','Pike','Quarterstaff','Ram','Rapier','Scimitar','Shortbow',
'Shortsword','Sickle','Sling','Spear','Sword','Trident','War Pick','Whip'
];

TPMVehicle := [
'Canoe','Carriage','Cart','Chariot','Galley','Rowboat','Sailboat','Sailing Ship',
'Sled','Wagon (Covered)','Wagon (Open)','Wagon (Vardo)'
];

TPMJewelry := [
'Amulet','Anklet','Armlet','Bangle (Glass)','Bangle (Metal)','Bangle (Wood)',
'Beads (Prayer)','Beads (Rosary)','Bracelet','Bracelet (Charm)','Bracelets',
'Brooche','Cameo','Chain, Belly','Chatelaine','Choker','Crown','Cuff Links',
'Dog Tags','Earring','Hair Pin','Necklace (Beads)','Necklace (Chain)','Necklace (Locket)',
'Necklace (Medallion)','Necklace (Pearls)','Pendant','Pin','Ring (Finger)',
'Ring (Puzzle)','Ring (Signet)','Ring (Thumb)','Ring (Toe)','Rope (Prayer)',
'Tiara','Tie (Bolo)','Torc (Torq)'
];

TPMRemains := [
'Arm','Blood','Brain','Entrails','Head','Heart','Leg','Liver','Skeleton',
'Skull','Teeth','Scales','Fang','Claw','Hide','Shell'
];

TPMInstruments := [
'Bagpipes','Bell','Citole','Drum','Drum (Hand)','Drum (War)','Dulcimer','Fiddle',
'Flute','Gittern','Gong','Guitar','Harp','Horn','Hurdy-Gurdy','Lute','Lyre',
'Mandolin','Recorder','Shawm','Tambourine','Trumpet','Viol'
];

TPMArmors := [
'Breastplate','Chain Mail','Chain Shirt','Half Plate','Helm','Hide','Leather',
'Padded','Plate','Ring Mail','Scale Mail','Shield','Splint','Studded'
];

TPMTraps := [
'Acid','Arrows','Automiton','Autonomous Sentry','Blades','Compactor','Darkness',
'Darts','Doppelganger','Fire Blasts','Fog','Frost','Illusion','Invisible Bridge',
'Laval','Lightening','Locked Doors','Magnets','Neddle','Pit','Pit (Attack)',
'Poison','Pressure Plate','Rust','Sand','Slide','Snare','Spikes','Teleport',
'Time Warp','Toxic Gas','Tumble','Water','Noxious Gas'
];



end.


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
  TPMConsumables : TPM2DStringArray;
  TPMSpells : TPM2DStringArray;

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
  TPMGems : TStringArray;
  TPMNatural: TStringArray;
  TPMUnnatural: TStringArray;
  TPMFlora: TStringArray;
  TPMFauna: TStringArray;

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


TPMNatural := [
'Arch (Stone)','Butte','Cave','Hill','Lake','Mushrooms','Pond','River','Rock',
'Rock (Balance)','Rock (Bear)','Rock (Buffalo)','Rock (Eagle)','Rock (Pipes)',
'Rock (Prism)','Rock (Skull)','Rock (Wave)','Rock (Wolf)','Stream','Stump',
'Tree (Enormous)','Tree (Lightening)','Tree (Petrified)','Waterfall (Large)',
'Waterfall (Small)'
];

TPMUnnatural := [
'Arch','Axe','Bag','Barral','Bottle','Bowl','Box','Breastplate','Bridge','Cabin',
'Cage','Campsite','Cannon','Cemetary','Chimney','Clothing','Cottage','Crate','Cross',
'Fence','Firepit','Graveyard','Helm','Jug','Key','Lamp','Lantern','Mine','Mound',
'Obelisk','Pitcher','Polearm','Post','Pylon','Pyramid','Ring','Road','Shield',
'Shrine','Sign','Steps','Sword','Tablet','Totem','Tower','Treehouse','Wagon',
'Wagon Wheel','Wall','Ziggurat'
];

TPMFlora := ['Ashe','Cactus','Crop','Elms','Ferns','Grass','Oaks','Pines','Vines',
'Wildflowers'
];

TPMFauna := ['Bat','Bear','Beaver','Bees','Bison','Butterfly','Cat','Chipmunk',
'Crab','Deer','Dog','Dragonfly','Elf','Firefly','Fox','Frog','Gopher','Hornets',
'Hummingbird','Livestock','Lizard','Moose','Mouse','Opossum','Otter','Porcupine',
'Rabit','Raccon','Rat','Salamander','Seal','Skunk','Snake','Songbird','Squirrel',
'Viper','Wasps','Wolf'
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

TPMSpells := [
['Title:Adhere','Effect:Object is covered in extremely sticky slime.'],
['Title:Animate Object','Effect:Object obeys your commands as best it can. It can walk 15ft per round.'],
['Title:Anthropomorphize','Effect:A touched animal either gains human intelligence or human appearance for L days.'],
['Title:Arcane Eye','Effect:You can see through a magical floating eyeball that flies around at your command.'],
['Title:Astral Prison','Effect:An object is frozen in time and space within an invulnerable crystal shell.'],
['Title:Attract','Effect:L+1 objects are strongly magnetically attracted to each other if they come within 10 feet.'],
['Title:Auditory Illusion','Effect:You create illusory sounds that seem to come from a direction of your choice.'],
['Title:Babble','Effect:A creature must loudly and clearly repeat everything you think. It is otherwise mute.'],
['Title:Beast Form','Effect:You and your possessions transform into a mundane animal.'],
['Title:Befuddle','Effect:L creatures of your choice are unable to form new short-term memories for the duration of the spell.'],
['Title:Bend Fate','Effect:Roll L+1 d20s. Whenever you must roll a d20 after casting the spell, you must choose and then discard one of the rolled results until they are all gone.'],
['Title:Bird Person','Effect:Your arms turn into huge bird wings.'],
['Title:Body Swap','Effect:You switch bodies with a creature you touch. If one body dies, the other dies as well.'],
['Title:Catherine','Effect:A woman wearing a blue dress appears until end of spell. She will obey polite, safe requests.'],
['Title:Charm','Effect:L creatures treat you like a friend.'],
['Title:Command','Effect:A creature obeys a single, three-word command that does not harm it.'],
['Title:Comprehend','Effect:You become fluent in all languages.'],
['Title:Control Plants','Effect:Nearby plants and trees obey you and gain the ability to move at 5 feet per round.'],
['Title:Control Weather','Effect:You may alter the type of weather at will, but you do not otherwise control it.'],
['Title:Counterspell','Effect:Make an opposed Intelligence save against the Intelligence of the caster of a nearby spell. You may do this out of turn as a reaction, or against an ongoing magical effect. On a success, you may cancel the spell.'],
['Title:Deafen','Effect:All nearby creatures are deafened.'],
['Title:Detect Magic','Effect:You hear nearby magical auras singing. Volume and harmony signify the aura’s power and refinement.'],
['Title:Disassemble','Effect:Any of your body parts may be detached and reattached at will, without causing pain or damage. You can still control them.'],
['Title:Disguise','Effect:You may alter the appearance of L characters at will as long as they remain humanoid. Attempts to duplicate other characters will seem uncanny.'],
['Title:Displace','Effect:An object appears to be up to L×10ft from its actual position.'],
['Title:Earthquake','Effect:The ground begins shaking violently. Structures may be damaged or collapse.'],
['Title:Elasticity','Effect:Your body can stretch up to L×10ft.'],
['Title:Elemental Wall','Effect:A straight wall of ice or fire L×40ft long and 10ft high rises from the ground.'],
['Title:Filch','Effect:L visible items teleport to your hands.'],
['Title:Fog Cloud','Effect:Dense fog spreads out from you.'],
['Title:Frenzy','Effect:L creatures erupt in a frenzy of violence.'],
['Title:Gate','Effect:A portal to a random plane opens.'],
['Title:Gravity Shift','Effect:You can change the direction of gravity (for yourself only) up to once per round.'],
['Title:Greed','Effect:L creatures develop an overwhelming urge to possess a visible item of your choice.'],
['Title:Haste','Effect:Your movement speed is tripled.'],
['Title:Hatred','Effect:L creatures develop a deep hatred of another creature or group of creatures and wish to destroy it.'],
['Title:Hear Whispers','Effect:You can hear faint sounds clearly.'],
['Title:Hover','Effect:An object hovers, frictionless, 2ft above the ground. It can hold up to L humanoids.'],
['Title:Hypnotize','Effect:A creature enters a trance and will truthfully answer L yes or no questions you ask it.'],
['Title:Icy Touch','Effect:A thick ice layer spreads across a touched surface, up to L×10ft in radius.'],
['Title:Illuminate','Effect:A floating light moves as you command.'],
['Title:Increase Gravity','Effect:The gravity in an area triples.'],
['Title:Invisible Tether','Effect:Two objects within 10ft of each other cannot be moved more than 10ft apart.'],
['Title:Knock','Effect:L nearby mundane or magical locks unlock.'],
['Title:Leap','Effect:You can jump up to L×10ft in the air.'],
['Title:Liquid Air','Effect:The air around you becomes swimmable.'],
['Title:Magic Dampener','Effect:All nearby magical effects have their effectiveness halved.'],
['Title:Manse','Effect:A sturdy, furnished cottage appears for L×12 hours. You can permit and forbid entry to it at will.'],
['Title:Marble Madness','Effect:Your pockets are full of marbles, and will refill every round.'],
['Title:Masquerade','Effect:L characters’ appearances and voices become identical to a touched character.'],
['Title:Miniaturize','Effect:You and L other touched creatures are reduced to the size of a mouse.'],
['Title:Mirror Image','Effect:L illusory duplicates of yourself appear under your control.'],
['Title:Mirrorwalk','Effect:A mirror becomes a gateway to another mirror that you looked into today.'],
['Title:Multiarm','Effect:You gain L extra arms.'],
['Title:Night Sphere','Effect:An L×40ft wide sphere of darkness displaying the night sky appears.'],
['Title:Objectify','Effect:You become any inanimate object between the size of a grand piano and an apple.'],
['Title:Ooze Form','Effect:You become a living jelly.'],
['Title:Pacify','L creatures have an aversion to violence.'],
['Title:Phantom Coach','Effect:A ghostly coach appears until end of spell. It moves unnaturally fast over any terrain, including water.'],
['Title:Phobia','Effect:L creatures become terrified of an object of your choice.'],
['Title:Pit','Effect:A pit 10ft wide and L×5ft deep opens in the ground.'],
['Title:Primeval Surge','Effect:An object grows to the size of an elephant. If it is an animal, it is enraged.'],
['Title:Psychometry','Effect:The referee answers L yes or no questions about a touched object.'],
['Title:Pull','Effect:An object of any size is pulled directly towards you with the strength of L men for one round.'],
['Title:Push','Effect:An object of any size is pushed directly away from you with the strength of L men for one round.'],
['Title:Raise Dead','Effect:L skeletons rise from the ground to serve you. They are incredibly stupid and can only obey simple orders.'],
['Title:Raise Spirit','Effect:The spirit of a dead body manifests and will answer L questions.'],
['Title:Read Mind','Effect:You can hear the surface thoughts of nearby creatures.'],
['Title:Repel','Effect:L+1 objects are strongly magnetically repelled from each other if they come within 10 feet.'],
['Title:Scry','Effect:You can see through the eyes of a creature you touched earlier today.'],
['Title:Sculpt Elements','Effect:All inanimate material behaves like clay in your hands.'],
['Title:Shroud','Effect:L creatures are invisible until they move.'],
['Title:Shuffle','Effect:L creatures instantly switch places. Determine where they end up randomly.'],
['Title:Sleep','Effect:L creatures fall into a light sleep.'],
['Title:Smoke Form','Effect:Your body becomes living smoke.'],
['Title:Snail Knight','Effect:10 minutes after casting, a knight sitting astride a giant snail rides into view. He is able to answer most questions related to quests and chivalry, and may aid you if he finds you worthy.'],
['Title:Sniff','Effect:You can smell even the faintest traces of scents.'],
['Title:Sort','Effect:Inanimate items sort themselves according to categories you set. The categories must be visually verifiable.'],
['Title:Spectacle','Effect:A clearly unreal but impressive illusion of your choice appears, under your control. It may be up to the size of a palace and has full motion and sound.'],
['Title:Spellseize','Effect:Cast this as a reaction to another spell going off to make a temporary copy of it that you can cast at any time before this spell ends.'],
['Title:Spider Climb','Effect:You can climb surfaces like a spider.'],
['Title:Summon Cube','Effect:Once per second, (6 times per round) you may summon or banish a 3-foot-wide cube of earth. New cubes must be affixed to the earth or to other cubes.'],
['Title:Swarm','Effect:You become a swarm of crows, rats, or piranhas. You only take damage from area effects.'],
['Title:Telekinesis','Effect:You may mentally move L items.'],
['Title:Telepathy','Effect:L+1 creatures can hear each other’s thoughts, no matter how far apart they move.'],
['Title:Teleport','Effect:An object disappears and reappears on the ground in a visible, clear area up to L×40ft away.'],
['Title:Thaumaturgic Anchor','Effect:Object becomes the target of every spell cast near it.'],
['Title:Thicket','Effect:A thicket of trees and dense brush up to L×40ft wide suddenly sprouts up.'],
['Title:Time Jump','Effect:An object disappears as it jumps L×10 minutes into the future. When it returns, it appears in the unoccupied area nearest to where it left.'],
['Title:Summon Idol','Effect:A carved stone statue the size of a four poster bed rises from the ground.'],
['Title:Time Rush','Effect:Time in a 40ft bubble starts moving 10 times faster.'],
['Title:Time Slow','Effect:Time in a 40ft bubble slows to 10%.'],
['Title:True Sight','Effect:You see through all nearby illusions.'],
['Title:Upwell','Effect:A spring of seawater appears.'],
['Title:Vision','Effect:You completely control what a creature sees.'],
['Title:Visual Illusion','Effect:A silent, immobile, illusion of your choice appears, up to the size of a bedroom.'],
['Title:Ward','Effect:A silver circle 40ft across appears on the ground. Choose one thing that cannot cross it: Living creatures, dead creatures, projectiles or metal.'],
['Title:Web','Effect:Your wrists can shoot thick webbing.'],
['Title:Wizard Mark','Effect:Your finger can shoot a stream of ulfire-colored paint. This paint is only visible to you, and can be seen at any distance, even through solid objects.'],
['Title:X-Ray Vision','Effect:You gain X-Ray vision.']
];

TPMConsumables := [
['Title:Wand','Charges:5','Effect:','Note:'],
['Title:Scroll','Charges:1','Effect:','Note:'],
['Title:Light Bandage','Charges:1','Effect:Heals +2','Note:Cannot be used in combat.'],
['Title:Medium Bandage','Charges:1','Effect:Heals +4','Note:Cannot be used in combat.'],
['Title:Heavy Bandage','Charges:1','Effect:Heals +6','Note:Cannot be used in combat.']
['Title:Great Healing Postion','Charges:1','Effect:Heals +2','Note:Can be used in combat.'],
['Title:Magnificent Healing Postion','Charges:1','Effect:Heals +4','Note:Can be used in combat.'],
['Title:Superb Healing Postion','Charges:1','Effect:Heals +4','Note:Can be used in combat.']
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

TPMGems := [
'Alexandrite','Amber','Amethyst','Ametrine','Ammolite','Andalusite','Andesine',
'Apatite','Aquamarine','Aventurine','Azurite','Beryl','Bixbite','Black Pearl',
'Black Spinel','Black Tourmaline','Blizzard Stone','Bloodstone','Blue Fluorite',
'Blue Moonstone','Blue Opal','Blue Sapphire','Blue Spinel','Blue Topaz','Blue Tourmaline',
'Blue Zircon','Boulder Opal','Brown Moonstone','Brown Zircon','Carnelian',
'Cats Eye Moonstone','Cats Eye Opal','Cats Eye Quartz','Chrome Diopside','Chrome Tourmaline',
'Chrysoberyl','Chrysocolla','Citrine','Clinohumite','Coral','Cornflower Blue Sapphire',
'Danburite','Demantoid Garnet','Diopside','Emerald','Fire Agate','Fire Opal','Fluorite',
'Garnet','Golden Sapphire','Golden Topaz','Goshenite','Grandidierite','Green Amethyst',
'Green Apatite','Green Garnet','Green Kyanite','Green Sapphire','Green Tanzanite',
'Green Tourmaline','Grey Sapphire','Heliodor','Hessonite','Howlite','Imperial Topaz',
'Indraneelam','Iolite','Jade','Jade Nephrite','Jadeite','Jasper','Khooni Neelam',
'Kunzite','Kyanite','Labradorite','Lapis Lazuli','Lavender Quartz','Lemon Quartz',
'Malachite','Mandarin Garnet','Mocha Scapolite','Moldavite','Monazite','Moonstone',
'Morganite','Moss Agate','Navratna','Obsidian','Onyx','Opal','Orange Kyanite',
'Orange Sapphire','Orthoclase','Padparadscha Sapphire','Panjshir Emerald',
'Paraiba Tourmaline','Peach Morganite','Peach Sapphire','Peacock Tanzanite',
'Pearl','Peridot','Persian Turquoise','Petalite','Petrified Wood','Pigeon Blood Ruby',
'Pink Coral','Pink Fluorite','Pink Morganite','Pink Opal','Pink Sapphire','Pink Spinel',
'Pink Topaz','Pink Tourmaline','Pitambari Neelam','Prehnite','Purple Garnet',
'Purple Sapphire','Rainbow Fluorite','Rainbow Moonstone','Red Coral','Red Spinel',
'Red Tourmaline','Red Zircon','Rhodochrosite','Rhodonite','Rose Quartz','Royal Blue Sapphire',
'Rubellite','Ruby','Rutilated Quartz','Sang Maryam','Sapphire','Tourmaline','Serpentine',
'Sillimanite Cats Eye','Sky Blue Topaz','Smoky Quartz','Sodalite','Spectrolite',
'Spessartite','Sphalerite','Spinel','Star Garnet','Star Ruby','Star Sapphire',
'Sunstone','Taaffeite','Tahitian Pearls','Tanzania Ruby','Tanzanite','Teal Sapphire',
'Tibetian Turquoise','Tiger Eye','Titanite','Topaz','Tourmaline','Trapiche Emerald',
'Tsavorite','Turquoise','Violet Sapphire','Vivid Green Emerald','Watermelon Tourmaline',
'White Coral','White Opal','White Sapphire','White Topaz','White Zircon','Yellow Beryl',
'Yellow Fluorite','Yellow Sapphire','Yellow Topaz','Yellow Zircon','Zircon','Zultanite'
];


end.


nn = new neural_network();
nn.add(new neuron_layer_input(2 + 8));
nn.add(new neuron_layer_hidden(8, ACTIVATION_TYPE.TANH));
nn.add(new neuron_layer_hidden(2, ACTIVATION_TYPE.TANH));

fitness = 0;
























/*
il = 4;
hl = 10;
ol = 3;

bias_input = random_range(0.3, 0.6);
bias_output = random_range(0.3, 0.6);

for(var i = 0; i < il; i ++) {
	inputs[i] = 0;
	
	for(var j = 0; j < hl; j ++) {
		hides[i] = 0;
		
		input_weights[j, i] = random_range(-0.5, 0.5);
	}
}

for(var i = 0; i < ol; i ++) {
	outputs[i] = 0;
	
	for(var j = 0; j < hl; j ++) {
		output_weights[j, i] = random_range(-0.5, 0.5);
	}
}

///* LOAD

//bias_input = -0.27291207101661724143681908572034;
//bias_output = 0.59218092553783208131790161132812; 
//input_weights= [ [ -2.5109262156347282868296133528929, -2.2935849275812354441939078242285 ], [ -0.21988621101714805883275971609692, -0.49031688482500557224597059757798 ], [ -0.02103627285454053030822052505755, 1.4194844593852611325246471096762 ], [ 1.0447640824783588353596996967099, 1.0075638050865352024487719972967 ], [ 0.19116969464346067475446488970192, -0.2275851158518342465253425643823 ] ];
//output_weights = [ [ -0.78778059899805685795115550718037, -2.1525090004922877717774554184871, -3.1933521655574037545477494859369 ], [ -2.649674550266964079270337606431, 4.5439684414258696421029526391067, -4.1330014011916231808640986855607 ], [ 5.833530382891158438951606513001, 2.7697990561369985051953790389234, 0.2125833518663359789080402606487 ], [ -1.8470392557187069737523188450723, 2.5504840703075886132467076095054, 2.3717971425317165845569888915634 ], [ -0.27940505068749688089013716307818, 3.1332055335678097307550160621759, 0.67037840920966762503496738645481 ] ];

#region FIRST. 4 8 3 (may be)

var str = { bias_input: 0.03587881100829729691392699919561, bias_output: 0.4838977966690432563900969853421, input_weights: [ [ -0.16209761479403764217188665952563, -1.7562264142511396780577115350752, -0.14221075913403463664153036916105, -0.91595139777287293281204938466544 ], [ 0.50846865340135438682267476906418, 2.5011980371595692318464898562524, -4.5184470377351013681277436262462, -0.24545708100312069177562079858035 ], [ -0.82457454980817868062104025739245, 1.0740117836370972614901120323339, -0.021799151659948778902986532557406, 1.9867466067522752126706109265797 ], [ 0.084565573343990438348605209739617, 0.18094831315334275467776592449809, -1.3753701732726644202386978577124, 2.0461673711985306489680169761414 ], [ -0.32555547102820364679942599650531, -1.2064447653992240727660600896343, 0.13272300424985256084298157475132, -0.41052939895541334935913369008631 ], [ 1.3443623643415185675564771372592, -1.0758600948518088902261524708592, 1.7602986074797779547651543907705, 1.4787831870699148506531628299854 ], [ 4.2471437020506828119437159330118, 0.87213679788168196882480742715416, -1.2958492709556643784907237204607, 1.1590319180348918060019514086889 ], [ -1.4420725100161497778117336565629, 1.2651847917493546091805001196917, -0.50513693008573989917664448512369, 0.89033101016190718812737259213463 ] ], output_weights: [ [ 1.8791553866024919283717053986038, -5.6752010560035754949126385326963, -4.3214694372424844459601445123553 ], [ -0.19541943462096464378952020979341, -3.9146019842475165972928152768873, 2.4230397332040287672327849577414 ], [ -2.8910544286016657267168739053886, 2.8432330240914809316166156349937, -4.4618723458563573913693289796356 ], [ -5.3261606538249290920816747529898, -2.8686017102701746317450215428835, -0.76055164951834364206462169022416 ], [ -0.17397558505650043136903093454748, -0.18041477405932077049399708812416, -4.2308100145682709936068022216205 ], [ -2.0180507651902490628970099351136, 0.018056339463220223706674261165972, -1.3827625345532077449917096600984 ], [ 6.5268618116155154851298902940471, -4.1219247697526872897810790163931, -3.8776271594641671391912041144678 ], [ 4.4956263512093936896008017356507, 0.25710492246317367959207444982894, 0.70895100734195126701564504401176 ] ] }
var str = { "bias_input": 0.052055407338775977477141054805543, "bias_output": 0.48194647384807332013423319949652, "input_weights": [ [ 0.32218248231802176784199787107354, -2.1973204912664336951877430692548, -0.45466679226141715197684334270889, -1.5495291482750277456403864562162 ], [ 0.09675118116661343692364027901931, 2.9312209907965063315771203633631, -4.3658134871256475406653407844715, 0.34258935072924318054887748985493 ], [ -1.2924542332673494282602177918307, 0.70962433612438802210675703463494, -0.18754437982105368054597249738435, 1.9015196786075727608533725287998 ], [ 0.045249176868221024916394412684895, 0.55992446540388340903149355654023, -1.5928791523584955314163380535319, 1.4931213007029133787995078819222 ], [ -0.27190187428612599962463036717963, -1.4570924970740559700743688154034, -0.05050298415124826467703655907826, -0.45133870873135556456290373716911 ], [ 1.2619922972610437827967189150513, -1.2874409967428002143918774891063, 1.8771784651605476490487944829511, 1.7602017553988669185116577864392 ], [ 4.0357847093232139812357672781218, 1.0310743955336434396485856268555, -1.2676909809513055016338967107004, 1.2309654309647120040693835107959 ], [ -1.5959463941492089134044363163412, 1.5703489797283078921452670329018, -0.15935506170151936267131986824097, 1.2847292621620114427827274994343 ] ], "output_weights": [ [ 1.2244352688267705620006609024131, -4.4727316103875596198236053169239, -3.916812436622578275091655086726 ], [ -0.63672166289292631002894040648243, -4.4214287375099461385730137408245, 1.8027790227951145940465949024656 ], [ -3.409725408162953996793476107996, 2.7988317309459720405584448599257, -5.0589289051806449748482918948866 ], [ -4.9727716604387826038191633415408, -1.259514070679448316525395057397, -0.8924709597137178151982084273186 ], [ 0.25048420103263641101065672955883, 0.15423736777622018556677119249798, -4.7483674263395512227248218550812 ], [ -1.9971689830906442786329080263386, 1.202712075635791633132498645864, -2.1085321113653745506155701150419 ], [ 6.3508624559733899417324209935032, -3.3208391983481275744338745425921, -3.9133397889742438380267230968457 ], [ 4.3147375068814177723197644809261, -0.031337045063277974010773618829262, 0.20174425800329512381559027289768 ] ] }
var str = { "bias_input": 0.083475397806614795581658938772307, "bias_output": 0.47189247852656901471846140339039, "input_weights": [ [ 0.076083014816977295735611619420524, -2.2443977947719360166445312643191, -0.876713602985259243816074103961, -1.6885667494963783052952521757106 ], [ 0.29671976469922267671819327006233, 3.0195178379955964764747022854863, -4.5680431042100231309177615912631, 0.31669129414017554990934399938851 ], [ -1.3295893463399288680903964632307, 0.77702306614256433370258037029998, -0.18307181372307901323637224777485, 1.8303326865471809536956016017939 ], [ 0.20455879827959652650370969695359, 0.42406148950568373079406114811718, -1.2943766711605577679478074060171, 1.7248918015276981652306176329148 ], [ -0.34444094097707889101656064667623, -1.5649895238922990614582886337303, 0.15993185779079358010967837344651, -0.35890692912508864731435664907622 ], [ 1.1290951380692668681859913704102, -0.94360239760018305155142570583848, 1.929013500730515140446641453309, 1.9035694238589919713433573633665 ], [ 4.2809328058687992069053507293575, 1.2763760079164032656962035616743, -1.4083958266954894611444615293294, 1.2011303468327945154214830836281 ], [ -1.5295006946939919689754106002511, 1.2525402080221257339331941693672, -0.49292786134874694292662411498895, 1.1856057338975489745536151531269 ] ], "output_weights": [ [ 1.6820866274647288118870847029029, -5.0486717109009591197832378384192, -3.6105954877892680876527720101876 ], [ -0.058840502635541733211788084645377, -4.0600497633404586395045043900609, 1.6113411891134092890354168048361 ], [ -3.613470637667964169281731301453, 3.009640226415358998934834744432, -5.3414295380143572700148979492951 ], [ -5.3462771736970582381331951182801, -1.5354890795657580859767676884076, -1.2685024717729869170312895221286 ], [ 0.43189320856702140272176393409609, 0.26549403001088384135286446507962, -4.586491579366867910039218259044 ], [ -2.2078771416004512317954322497826, 1.7327624501567349124542261051829, -1.9980162085965538221188353418256 ], [ 6.2353242283780128119019536825363, -2.8318910224782487539130215736805, -3.1776527277054071873862994834781 ], [ 4.4065268116631273187522310763597, -0.21597824208905344600673004151759, 0.041322293644756286079555707146937 ] ] }
var str = { "bias_input": 0.11227417509071555001831654863054, "bias_output": 0.13110702165868065582898793763889, "input_weights": [ [ -0.11419038259424232895078432648006, -2.0675703162327385697949466702994, -0.98707921619992999850978776521515, -1.6829292872687726667635388366762 ], [ 0.1479025536123610984340359664202, 2.9828411078592047545043897116557, -4.4400496992097044923752946488094, 0.25019431441090289602868779184064 ], [ -1.6533733900217357781770033398061, 0.41441172440535362087032922318031, -0.2206893206620655911720518815855, 1.5983216873742533969959822570672 ], [ 0.76825040207708494843785729244701, 0.25173084049950295026931712527585, -1.5554026248073020699536073152558, 1.2636671165749364664776521749445 ], [ -0.13208514955826519687853703999281, -1.8065275688190132186150549387094, 0.15991618676110672114809574395622, -0.41119941538666510139066190276935 ], [ 1.1290951380692668681859913704102, -0.94360239760018305155142570583848, 1.929013500730515140446641453309, 1.9035694238589919713433573633665 ], [ 4.2809328058687992069053507293575, 1.2763760079164032656962035616743, -1.4083958266954894611444615293294, 1.2011303468327945154214830836281 ], [ -1.5295006946939919689754106002511, 1.2525402080221257339331941693672, -0.49292786134874694292662411498895, 1.1856057338975489745536151531269 ] ], "output_weights": [ [ 1.3262010657694063286982100180467, -4.815623051580035784979827440111, -3.663641982036658362176240189001 ], [ -0.23210593287363956438440482088481, -3.7116609060298211275608082360122, 1.6206808451143648319714429817395 ], [ -3.1083996183984341499240144912619, 3.3720695620076677201382153725717, -5.4996921273181467171298208995722 ], [ -5.3691367499949853581142633629497, -2.0339168214099672127304074820131, -0.8092549906950763372037727094721 ], [ 0.51532122909088207141081738882349, 0.099573556580578481689514092067839, -4.6522922532353678803929142304696 ], [ -2.2078771416004512317954322497826, 1.7327624501567349124542261051829, -1.9980162085965538221188353418256 ], [ 6.2353242283780128119019536825363, -2.8318910224782487539130215736805, -3.1776527277054071873862994834781 ], [ 4.4065268116631273187522310763597, -0.21597824208905344600673004151759, 0.041322293644756286079555707146937 ] ] }

#endregion

#region SECOND. 4 10 3 - 75

var str = { "output_weights": [ [ 0.070045020412646014085211731980962, 4.4105799083970609331117884721607, 0.24977319957687282858671551366569 ], [ 3.5322930809669155216568015021039, -6.4144834513217237059734543436207, -0.21150434860960309890742792049423 ], [ 0.029546206248902633084707503030586, -1.2775056296866196259287562497775, 0.85261462031863155530686526617501 ], [ 0.3796779780835130013727507503063, -4.6067506316025310653117230685893, -1.2976147002261242402454399780254 ], [ 2.6674967083708098769534444727469, -0.80098645075225372025329306779895, -0.50845999591052337684971007547574 ], [ 1.7733643033541903744065848513856, -5.5130424716509836002842348534614, -3.2075040903873843767257767467527 ], [ 5.0174546329211553441496107552666, -4.1155983844400205740043929836247, -3.9827454126998880212795484112576 ], [ -1.9147334849368711218176031252369, 3.3109667213912863381608531199163, -1.1963791797030531860457358561689 ], [ -3.9228988662828214728506281971931, -2.0918939932808457982105210248847, -2.0326005972083698303265464346623 ], [ -0.47249285191296980235264868497325, -2.9562684459053638619252524222247, 1.750300066890179584433440140856 ] ], "bias_input": 0.049869182123802813233481856514118, "bias_output": -0.059222011547535272080189372445602, "input_weights": [ [ 2.0322934733005415530726622819202, 2.9839783552056311499711682699854, -0.61759700594468158740824037522543, 1.271755021833810506137751872302 ], [ -0.30346767934971774494101737218443, 1.4524762394884715988041534728836, 2.7809866240434293338523730199086, 0.56843691290821041217640186005156 ], [ 0.4841610163263772026454034858034, -1.845836287066324077343892895442, 0.70727763853966951757001879741438, 4.5361862820107887728227069601417 ], [ 1.9629351810831583424743485011277, 1.5058897752920059609493819152704, -3.389142260951909069177645505988, -1.2590786108234952589413069290458 ], [ -1.2829666939610560039142228561104, 4.026420066030714117744082614081, -0.10610940213779757046452800750558, -1.4509614513535136204325226572109 ], [ -2.119672477766875395843726437306, 0.83533482564146666060622692384641, -0.96164730994031466515536976658041, -1.227094053346669433324223064119 ], [ 0.59087814120109716231610264003393, 0.3858272708486767399449490767438, 2.5391919381125021004663722123951, -0.35604605376254189197382515885693 ], [ -3.3604064315324579936827831261326, 1.365902805002417563784433696128, -0.7059451207239157977113563902094, -2.5857576530333603592737290455261 ], [ 2.4031353203066854185010470246198, 0.066084301141090526221510970117379, -0.3556019685557102461004319593485, 0.78892240166198301931643754869583 ], [ 1.3032685423176928463107060451875, -1.9900245918054078053671673842473, 0.39394750858657251457728420973581, 0.86328899461310193430563231231645 ] ] }
var str = { "output_weights": [ [ 0.0090520554408354270137238017923664, 4.3606375632993978896934095246252, 0.28913859250022794222800825991726 ], [ 3.5408531822264159849567022320116, -6.4075118874572227767316690005828, -0.21839381970465837623507354692265 ], [ 0.012520502330713823707641907390098, -1.3322596029937074924021089827875, 0.87406463101505749158093294681748 ], [ 0.40731076044032660243843224634475, -4.6262067369092765289906310499646, -1.2311338272784015934746548737166 ], [ 2.6268277242407847005267740314594, -0.78233218892478517680899585684529, -0.46894200849346634463188365771202 ], [ 1.7422372095007614412054408603581, -5.5598613277170763069534586975351, -3.1660761983879002201547336881049 ], [ 5.0746428135130656755791278555989, -4.1560170669295652956520825682674, -3.9892882551811736924207707488677 ], [ -1.7859580571576882945805664348882, 3.2409824024140649889602627808927, -1.2226302056107485327629547100514 ], [ -3.964419450070754802339934030897, -2.0460175383463679033013704611221, -2.0046228171326263556295543821761 ], [ -0.51384420976973521621999907438294, -2.9603351398371828828715024428675, 1.7594439162127522013889802110498 ] ], "bias_input": -0.039967024000361367486178210128855, "bias_output": -0.25319904079660732199030803712958, "input_weights": [ [ 2.0565037077060148718032905890141, 2.9564486588444691683719156571897, -0.62298602830151217357723680834169, 1.2649532594392036699559866974596 ], [ -0.31827416265384572691132802901848, 1.5066139198839776369709397840779, 2.820941909914831402517165770405, 0.54996217778417388899470097385347 ], [ 0.49618617254307306740912508757901, -1.8367569802654744037795353506226, 0.69647126063238584681158727107686, 4.547450718330260599486791761592 ], [ 1.9536140976147728931522351558669, 1.5286605492932616723322780671879, -3.3732113580917810757853203540435, -1.243275613053707262523062127002 ], [ -1.2967851061280764035643642273499, 4.0227618706040271234769534203224, -0.10418212335555653014207422302206, -1.4762059706822119320435149347759 ], [ -2.1016787731321566745634754624916, 0.86717395373153527415865937655326, -0.93374006378930696214979434444103, -1.2650049908971472412133607576834 ], [ 0.57124784077517265501455767662264, 0.38564433508552636853394801619288, 2.5239488525455930911789437232073, -0.37939648365601313928507920536504 ], [ -3.3510921849775989755926275392994, 1.3622354863770422817026428674581, -0.72341200164984698073311619737069, -2.6217596148606383543722131435061 ], [ 2.407746666259992895930963641149, 0.081337794284336115135936040587694, -0.33424636824056414008410342830757, 0.7958154633967190472176866933296 ], [ 1.3136754566943471544959720631596, -1.9779578454140518406489945846261, 0.40828169958666166161620481034333, 0.8911204614490253472780523225083 ] ] }

#endregion

parse = function(_struct) {
	var names = variable_struct_get_names(_struct);
	for(var i = 0; i < variable_struct_names_count(_struct); i ++) {
		variable_instance_set(id, names[i], _struct[$ names[i]]);
	}
}

parse(str);

//*/

mutate = function() {
	for(var i = 0; i < il; i ++) {	
		for(var j = 0; j < hl; j ++) {
			bias_input += random_range(-0.05, 0.05);
			
			input_weights[j, i] += random_range(-0.01, 0.01);
		}
	}
	
	for(var i = 0; i < ol; i ++) {
		for(var j = 0; j < hl; j ++) {
			bias_output += random_range(-0.05, 0.05);
			
			output_weights[j, i] += random_range(-0.02, 0.02);
		}
	}
}

fitness_time = 30;
fitness_timer = fitness_time;

fitness = 0;

spd_angle = 3;
spd_moving = 20;










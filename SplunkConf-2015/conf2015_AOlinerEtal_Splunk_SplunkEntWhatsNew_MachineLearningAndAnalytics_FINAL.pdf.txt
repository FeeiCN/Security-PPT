Copyright*©*2015*Splunk*Inc.*
Machine*Learning*and* AnalyQcs*in*Splunk**
Adam*J.*Oliner*
Principal*Engineer,*Splunk*
* Brad*Block,*Ari*Brown,*Jacob*Leverich,* Andrea*Longdon,*Di*Lu,*Iman*Makaremi,* Ben*Moskowitz,*Manish*Sainani,* Sergey*Slepian,*Sinduja*Sreshta,* Zidong*Tang,*Brooke*Wenig,*Jonas*Yao,* Fred*Zhang*

Disclaimer*
During*the*course*of*this*presentaQon,*we*may*make*forward*looking*statements*regarding*future* events*or*the*expected*performance*of*the*company.*We*cauQon*you*that*such*statements*reflect*our* current*expectaQons*and*esQmates*based*on*factors*currently*known*to*us*and*that*actual*events*or* results*could*differ*materially.*For*important*factors*that*may*cause*actual*results*to*differ*from*those*
contained*in*our*forwardVlooking*statements,*please*review*our*filings*with*the*SEC.*The*forwardV looking*statements*made*in*the*this*presentaQon*are*being*made*as*of*the*Qme*and*date*of*its*live* presentaQon.*If*reviewed*aXer*its*live*presentaQon,*this*presentaQon*may*not*contain*current*or* accurate*informaQon.*We*do*not*assume*any*obligaQon*to*update*any*forward*looking*statements*we*
may*make.** *
In*addiQon,*any*informaQon*about*our*roadmap*outlines*our*general*product*direcQon*and*is*subject*to* change*at*any*Qme*without*noQce.*It*is*for*informaQonal*purposes*only*and*shall*not,*be*incorporated* into*any*contract*or*other*commitment.*Splunk*undertakes*no*obligaQon*either*to*develop*the*features*
or*funcQonality*described*or*to*include*any*such*feature*or*funcQonality*in*a*future*release.*
2*

Agenda*
 Machine*learning*and*staQsQcs*  ML*Toolkit*and*Showcase*app*  Demo!*  How*to*acquire*and*use*the*app* *
3*

ML*and*StaQsQcs*
 Process*for*generalizing*from*examples*
­ ML:*(labeled)*examples**model* ­ Stats:*sample**populaQon*
 E.g.,*face*recogniQon*
­ Hard*to*write*the*code*from*scratch* ­ Easy*to*give*examples*of*faces*and*nonVfaces*
! Label*which*is*which*=*supervised*learning* ! Tell*it*split*into*two*groups,*no*labels*=*unsupervised*learning*
4*

Insider*Threat*(User*Behavior*AnalyQcs)*
1. Log*cloud*storage*data*transfer* 2. Build*a*predicQve*model* 3. Refine*unQl*predicQons*are*accurate* 4. Detect*large*predicQon*errors* 5. InvesQgate*
5*

Capacity*Planning*
1. Log*resource*uQlizaQon*(e.g.,*disk*capacity)* 2. Build*a*predicQve*model*based*on*past*values* 3. Refine*unQl*predicQons*are*accurate* 4. Forecast*resource*saturaQon*or*demand* 5. Act*
6*

Predict*Customer*Churn*
1. Build*a*model*that*predicts*customer*churn* 2. Refine*unQl*predicQons*are*accurate* 3. Predict*when*customers*will*churn* 4. Inspect*the*model*to*see*what*factors*drive*churn* 5. Act*
7*

The*Process*
1. Clean*&*transform* 2. Fit&a&model& 3. Refine&the&model& 4. Apply&to&make&predic9ons& 5. Detect&anomalies& 6. Alert* 7. Act*
8*

ML*Toolkit*and* Showcase*App*

ML*Toolkit*and*Showcase*App*
An*app*that*adds*extensible*machine*learning* commands*tPor*SePvLie.*wTh&Ree*slheoawsec!a& ses*embody* bestVpracQces*of*parQcular*analyQcs.*
10*

ML*SPL*
 Generic*grammar*
­ Follows*the*lead*of*popular*ML*libraries* ­ Doesn't*cluker*SPL*
 fit,%apply,%summary%
11*

ML*SPL*
 Fit*a*(persistent)*model*using*training*data*  Apply*a*model*to*new*data*to*make*predicQons*  Inspect*a*summary*of*the*model*
summary%

fit%

apply%
12*

ML*SPL*Example*
 [training(data]!|!fit!LinearRegression!into! my_model!costly_KPI!from!metric1!metric2!metric3!
 [test(data]!|!apply!my_model!as!pred_kpi_value!  |!summary!my_model!
13*

Demo!*

Using*the*App*
 Act*on*alerts*and*reports*  Use*dashboards*as*tools*  Adapt*dashboards*to*your*needs*  Apply*models*  Use*ML*SPL*  Build*custom*dashboards*and*
visualizaQons*  Build*custom*analyQcs*
15*

Behind*the*Curtain*
 Uses*only*public*interfaces*and*libraries*  DistribuQon*of*the*python*data*science*ecosystem*
­ scitkitVlearn,*pandas,*numpy,*scipy,*and*much*more* ­ On*Splunkbase:*Python*for*ScienQfic*CompuQng*
 "Just*an*app"*  Source*code*is*packaged*in*the*app*
16*

Preview*Release*Caveats*
 Limited*to*50k*training*events*
­ Can*apply*model*to*unlimited*events*
 Limited*to*a*single*search*head*
­ No*support*for*search*head*clustering* ­ Does*not*distribute*work*to*indexers*
 Limited*to*an*iniQal*set*of*analyQcs*  CommunityVsupported*app*  Plus*all*the*other*caveats*you'd*expect*of*a*preview*release*
17*

Gimme!*Gimme!*
 ML*Toolkit*and*Showcase*App*
­ Preview*Release*is*Free*on*Splunkbase*
 Dependencies*
­ Splunk*6.3* ­ Python*for*ScienQfic*CompuQng*
hkp://Qny.cc/splunkmlapp*
18*


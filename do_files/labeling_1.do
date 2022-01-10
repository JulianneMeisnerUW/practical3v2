iecodebook apply using "$projectDoc/codebook_templatev1.xlsx", drop missingvalues(.d "Don't Know" .r "Refused" .n "Not Applicable")
destring region s00q05 s00q08, replace //Lines 33-36 allow us to apply value levels in the next chunk of code
destring s02q02 s02q03 s02q08, replace
destring s03q12_a s03q12_b s03q12_c s03q12_d s03q12_e s03q12_f s03q12_g s03q13, replace
destring s06q01- s06q15, replace
save "$projectData/newdata" 

iecodebook apply using "$projectDoc/codebook_templatev2.xlsx", drop missingvalues(.d "Don't Know" .r "Refused" .n "Not Applicable")
save "$projectData/finaldata" //This saves your final data with variable and value labels

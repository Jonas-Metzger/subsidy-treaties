!wget https://zenodo.org/record/6016583/files/rffsps_v5.7z
!7za x archive.7z -r -ir!rffsp_pop_in* -o./pop_income
!7za x archive.7z -r -ir!*emissions.csv -o./emissions
!7za x archive.7z -r -ir!README.md
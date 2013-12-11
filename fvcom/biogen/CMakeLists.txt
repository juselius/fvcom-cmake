set (BIO
    bacteria.F
    bio_mixing.F
    detritus.F
    DOM.F
    get_parameter.F
    mod_1D.F
    mod_bacteria.F
    mod_detritus.F
    mod_DOM.F
    mod_nutrient.F
    mod_phytoplankton.F
    mod_zooplankton.F
    nutrient.F
    phytoplankton.F
    zooplankton.F
    )

set (srcdir ${FVCOM_ROOT}/FVCOM_source/BIO_source)
add_prefix(BIO ${srcdir} "${BIO}")

add_library(bio STATIC ${BIO})

install(TARGETS bio
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )

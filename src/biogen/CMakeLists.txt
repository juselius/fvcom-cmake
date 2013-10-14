set (srcdir ${FVCOM_DIR}/FVCOM_source/BIO_source)
add_library(bio STATIC
    ${srcdir}/bacteria.F
    ${srcdir}/bio_mixing.F
    ${srcdir}/detritus.F
    ${srcdir}/DOM.F
    ${srcdir}/get_parameter.F
    ${srcdir}/mod_1D.F
    ${srcdir}/mod_bacteria.F
    ${srcdir}/mod_detritus.F
    ${srcdir}/mod_DOM.F
    ${srcdir}/mod_nutrient.F
    ${srcdir}/mod_phytoplankton.F
    ${srcdir}/mod_zooplankton.F
    ${srcdir}/nutrient.F
    ${srcdir}/phytoplankton.F
    ${srcdir}/zooplankton.F
    )

install(TARGETS bio
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )

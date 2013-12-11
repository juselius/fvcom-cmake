set (MODS
    mod_prec.F
    sinter.F
    mod_types.F
    mod_time.F
    mod_main.F
    mod_spherical.F
    mod_utils.F
    mod_clock.F
    eqs_of_state.F
    mod_bulk.F
    mod_interp.F
    mod_par.F
    mod_ncll.F
    mod_nctools.F
    mod_wd.F
    mod_sng.F
    mod_heatflux.F
    mod_input.F
    mod_force.F
    mod_obcs.F
    mod_petsc.F
    mod_semi_implicit.F
    mod_non_hydro.F
    mod_set_time.F
    ice_kinds_mod.F
    ice_model_size.F
    ice_domain.F
    ice_constants.F
    ice_fileunits.F
    ice_state.F
    ice_work.F
    ice_grid.F
    ice_albedo.F
    ice_calendar.F
    ice_flux.F
    ice_flux_in.F
    ice_itd.F
    ice_mechred.F
    ice_itd_linear.F
    ice_scaling.F
    ice_atmo.F
    ice_ocean.F
    ice_therm_vertical.F
    ice_init.F
    ice_therm_itd.F
    mod_ice2d.F
    mod_ice.F
    mod_startup.F
    mod_wqm.F
    mod_ncdio.F
    mod_setup.F
    mod_newinp.F
    particle.F
    linklist.F
    mod_lag.F
    mod_northpole.F
    mod_pwp.F
    mod_optimal_interpolation.F
    mod_report.F
    mod_probe.F
    mod_gotm.F
    mod_balance_2d.F
    mod_tridiag.F
    mod_scal.F
    mod_meanflow.F
    mod_obcs2.F
    mod_obcs3.F
    mod_sed.F
    mod_enkf.F
    mod_etkf.F
    mod_rrk.F
    mod_rrkf_obs.F
    mod_rrkassim.F
    mod_enkf_ncd.F
    enkf_ncdio.F
    mod_enkf_obs.F
    mod_enkfassim.F
    mod_assim.F
    mod_nesting.F
    mod_visit.F
    mod_plbc.F
    mod_dam.F
    mod_station_timeseries.F
    mod_boundschk.F
    )

if (ENABLE_DYE_RELEASE)
    set (MODS ${MODS} mod_dye.F)
endif()

set (MODS_W
    mod_main_wave.F
    swmod1.F
    swmod2.F
    swmod3.F
    mod_action_im.F
    mod_action_ex.F
    mod_wavesetup.F
    mod_bbl.F
    )
if (ENABLE_WAVE_CURRENT_INTERACTION)
    set (MODS_W ${MODS_W} mod_wave_current_interaction.F)
endif()

set (MAIN
    genmap.F
    Vtge.F
    Vlongshore_flow.F
    Vcell_area.F
    Vopen_all.F
    Vload_grid.F
    Vallocate_all.F
    Vsetup_domain.F
    Vgenmap_obc.F
    Vgenmap_lsf.F
    Vprint_vals.F
    Vcoords_n_const.F
    Vshape_coef_gcn.F
    Vshape_coef_gcy.F
    Vdepth_grad.F
    Vgrid_metrics.F
    Vcntrl_prmtrs.F
    Vinit_sed.F
    Vinternal_step.F
    Vbcond_gcn.F
    Vbcond_gcy.F
    Vadjust2d3d.F
    Vbrough.F
    Vadvection_edge_gcn.F
    Vadvection_edge_gcy.F
    Vghostuv.F
    Vadvave_edge_gcn.F
    Vadvave_edge_gcy.F
    Vphy_baropg.F
    Vbaropg.F
    Vexternal_step.F
    Vextel_edge.F
    Vextuv_edge.F
    Vdepth_check.F
    Vvertvl_edge.F
    Vadv_uv_edge_gcn.F
    Vadv_uv_edge_gcy.F
    Vvdif_uv.F
    Vextelpf_edge.F
    Vwreal.F
    Vviscofh.F
    Vadv_q.F
    Vfct_q2.F
    Vfct_q2l.F
    Vvdif_q.F
    Vadv_t.F
    Vadv_s.F
    Vfct_t.F
    Vvdif_ts.F
    Vvdif_ts_gom.F
    Vfct_s.F
    Vbcond_ts.F
    Vadjust_ts.F
    Vconv_over.F
    Vvisitsim.F
    Vstartup_type.F
    Vedge_len.F
    Vadcor.F
    Vicing.F
    Vrho_pmean.F
    Vcalc_vort.F
    Vnamelist.F
    Vnh_set_nesting.F
    )

set (MAIN_W
    ocpmix.F
    ocpcre.F
    ocpids.F
    swanpre1.F
    swanpre2.F
    swanser.F
    swanmain.F
    swancom1.F
    swancom2.F
    swancom3.F
    swancom4.F
    swancom5.F
    )

set (COBJS
    func_pointer.c
    )

set (BIOGEN
    mod_bio_3D.F
    mod_onedtide.F
    )

include_directories(
    ${NETCDF_INCLUDES}
    ${JULIAN_INCLUDE_DIR}
    )

set (srcdir ${FVCOM_ROOT}/FVCOM_source)

add_prefix(MODS ${srcdir} "${MODS}")
add_prefix(MODS_W ${srcdir} "${MODS_W}")
add_prefix(MAIN ${srcdir} "${MAIN}")
add_prefix(MAIN_W ${srcdir} "${MAIN_W}")
add_prefix(BIOGEN ${srcdir} "${BIOGEN}")
add_prefix(COBJS ${srcdir} "${COBJS}")

add_library(fvcom SHARED
    ${MODS}
    ${MODS_W}
    ${MAIN}
    ${MAIN_W}
    ${BIOGEN}
    ${COBJS}
    )

add_executable(fvcom.bin ${srcdir}/fvcom.F)

if (ENABLE_GOTM)
    set (GOTM_LIBS
        turbulence
        util
        meanflow
        )
endif()

if (ENABLE_MULTIPROCESSOR)
    set(PARLIB ${METIS_LIBRARY})
    include_directories(
        ${METIS_INCLUDE_DIR}
        )
endif()

target_link_libraries(fvcom.bin
    fvcom
    ${GOTM_LIBS}
    ${PARLIB}
    ${BIOLIBS}
    ${JULIAN_LIBRARY}
    ${PROJ_LIBRARY}
    ${FPROJ_LIBRARY}
    ${BLAS_LIBRARIES}
    ${LAPACK_LIBRARIES}
    ${NETCDF_LIBRARIES_F90}
    )

install(TARGETS fvcom.bin fvcom
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )

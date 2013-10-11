set (srcdir ${PROJECT_SOURCE_DIR}/../FVCOM_source)
set (MODS
${srcdir}/mod_prec.F
${srcdir}/sinter.F
${srcdir}/mod_types.F
${srcdir}/mod_time.F
${srcdir}/mod_main.F
${srcdir}/mod_spherical.F
${srcdir}/mod_utils.F
${srcdir}/mod_clock.F
${srcdir}/eqs_of_state.F
${srcdir}/mod_bulk.F
${srcdir}/mod_interp.F
${srcdir}/mod_par.F
${srcdir}/mod_ncll.F
${srcdir}/mod_nctools.F
${srcdir}/mod_wd.F
${srcdir}/mod_sng.F
${srcdir}/mod_heatflux.F
${srcdir}/mod_input.F
${srcdir}/mod_force.F
${srcdir}/mod_obcs.F
${srcdir}/mod_petsc.F
${srcdir}/mod_semi_implicit.F
${srcdir}/mod_non_hydro.F
${srcdir}/mod_set_time.F
${srcdir}/ice_kinds_mod.F
${srcdir}/ice_model_size.F
${srcdir}/ice_domain.F
${srcdir}/ice_constants.F
${srcdir}/ice_fileunits.F
${srcdir}/ice_state.F
${srcdir}/ice_work.F
${srcdir}/ice_grid.F
${srcdir}/ice_albedo.F
${srcdir}/ice_calendar.F
${srcdir}/ice_flux.F
${srcdir}/ice_flux_in.F
${srcdir}/ice_itd.F
${srcdir}/ice_mechred.F
${srcdir}/ice_itd_linear.F
${srcdir}/ice_scaling.F
${srcdir}/ice_atmo.F
${srcdir}/ice_ocean.F
${srcdir}/ice_therm_vertical.F
${srcdir}/ice_init.F
${srcdir}/ice_therm_itd.F
${srcdir}/mod_ice2d.F
${srcdir}/mod_ice.F
${srcdir}/mod_startup.F
${srcdir}/mod_wqm.F
${srcdir}/mod_ncdio.F
${srcdir}/mod_setup.F
${srcdir}/mod_newinp.F
${srcdir}/particle.F
${srcdir}/linklist.F
${srcdir}/mod_lag.F
${srcdir}/mod_northpole.F
${srcdir}/mod_pwp.F
${srcdir}/mod_dye.F
${srcdir}/mod_optimal_interpolation.F
${srcdir}/mod_report.F
${srcdir}/mod_probe.F
${srcdir}/mod_gotm.F
${srcdir}/mod_balance_2d.F
${srcdir}/mod_tridiag.F
${srcdir}/mod_scal.F
${srcdir}/mod_meanflow.F
${srcdir}/mod_obcs2.F
${srcdir}/mod_obcs3.F
${srcdir}/mod_sed.F
${srcdir}/mod_enkf.F
${srcdir}/mod_etkf.F
${srcdir}/mod_rrk.F
${srcdir}/mod_rrkf_obs.F
${srcdir}/mod_rrkassim.F
${srcdir}/mod_enkf_ncd.F
${srcdir}/enkf_ncdio.F
${srcdir}/mod_enkf_obs.F
${srcdir}/mod_enkfassim.F
${srcdir}/mod_assim.F
${srcdir}/mod_nesting.F
${srcdir}/mod_visit.F
${srcdir}/mod_plbc.F
${srcdir}/mod_dam.F
${srcdir}/mod_station_timeseries.F
${srcdir}/mod_boundschk.F
    )

set (MODS_W
${srcdir}/mod_main_wave.F
${srcdir}/swmod1.F
${srcdir}/swmod2.F
${srcdir}/swmod3.F
${srcdir}/mod_action_im.F
${srcdir}/mod_action_ex.F
${srcdir}/mod_wavesetup.F
${srcdir}/mod_wave_current_interaction.F
${srcdir}/mod_bbl.F
    )

set (MAIN
${srcdir}/genmap.F
${srcdir}/tge.F
${srcdir}/longshore_flow.F
${srcdir}/cell_area.F
${srcdir}/open_all.F
${srcdir}/load_grid.F
${srcdir}/allocate_all.F
${srcdir}/setup_domain.F
${srcdir}/genmap_obc.F
${srcdir}/genmap_lsf.F
${srcdir}/print_vals.F
${srcdir}/coords_n_const.F
${srcdir}/shape_coef_gcn.F
${srcdir}/shape_coef_gcy.F
${srcdir}/depth_grad.F
${srcdir}/grid_metrics.F
${srcdir}/cntrl_prmtrs.F
${srcdir}/init_sed.F
${srcdir}/internal_step.F
${srcdir}/bcond_gcn.F
${srcdir}/bcond_gcy.F
${srcdir}/adjust2d3d.F
${srcdir}/brough.F
${srcdir}/advection_edge_gcn.F
${srcdir}/advection_edge_gcy.F
${srcdir}/ghostuv.F
${srcdir}/advave_edge_gcn.F
${srcdir}/advave_edge_gcy.F
${srcdir}/phy_baropg.F
${srcdir}/baropg.F
${srcdir}/external_step.F
${srcdir}/extel_edge.F
${srcdir}/extuv_edge.F
${srcdir}/depth_check.F
${srcdir}/vertvl_edge.F
${srcdir}/adv_uv_edge_gcn.F
${srcdir}/adv_uv_edge_gcy.F
${srcdir}/vdif_uv.F
${srcdir}/extelpf_edge.F
${srcdir}/wreal.F
${srcdir}/viscofh.F
${srcdir}/adv_q.F
${srcdir}/fct_q2.F
${srcdir}/fct_q2l.F
${srcdir}/vdif_q.F
${srcdir}/adv_t.F
${srcdir}/adv_s.F
${srcdir}/fct_t.F
${srcdir}/vdif_ts.F
${srcdir}/vdif_ts_gom.F
${srcdir}/fct_s.F
${srcdir}/bcond_ts.F
${srcdir}/adjust_ts.F
${srcdir}/conv_over.F
${srcdir}/visitsim.F
${srcdir}/startup_type.F
${srcdir}/edge_len.F
${srcdir}/adcor.F
${srcdir}/icing.F
${srcdir}/rho_pmean.F
${srcdir}/calc_vort.F
${srcdir}/namelist.F
${srcdir}/nh_set_nesting.F
    )

set (MAIN_W
${srcdir}/ocpmix.F
${srcdir}/ocpcre.F
${srcdir}/ocpids.F
${srcdir}/swanpre1.F
${srcdir}/swanpre2.F
${srcdir}/swanser.F
${srcdir}/swanmain.F
${srcdir}/swancom1.F
${srcdir}/swancom2.F
${srcdir}/swancom3.F
${srcdir}/swancom4.F
${srcdir}/swancom5.F
    )

set (COBJS
    ${srcdir}/func_pointer.c
    )

set (BIOGEN
    ${srcdir}/mod_bio_3D.F
    ${srcdir}/mod_onedtide.F
    )

include_directories(
    ${NETCDF_INCLUDES}
    ${JULIAN_INCLUDE_DIR}
    )

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

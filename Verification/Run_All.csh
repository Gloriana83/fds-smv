#!/bin/csh -f
setenv SVNROOT ~/FDS-SMV
setenv FDS $SVNROOT/FDS_Compilation/intel_linux_32/fds5_intel_linux_32
set RUNFDS=$SVNROOT/Utilities/Scripts/runfds.csh
setenv BASEDIR `pwd`

$RUNFDS Atmospheric_Effects lee_waves             fire41 &
$RUNFDS Atmospheric_Effects stack_effect          fire42 &
$RUNFDS Controls activate_vents                   fire43 &
$RUNFDS Controls control_test                     fire44 &
$RUNFDS Controls create_remove                    fire45 &
$RUNFDS Controls cycle_test                       fire41 &
$RUNFDS Controls device_test                      fire42 &
$RUNFDS Detectors aspiration_detector             fire43 &
$RUNFDS Detectors beam_detector                   fire44 &
$RUNFDS Fires box_burn_away                       fire45 &
$RUNFDS Fires cable_tray                          fire46 &
$RUNFDS Fires couch                               fire47 &
$RUNFDS Fires room_fire                           fire51 &
$RUNFDS Fires spray_burner                        fire52 &
$RUNFDS Flowfields dancing_eddies                 fire53 &
$RUNFDS Flowfields gas_filling                    fire54 &
$RUNFDS Flowfields hallways                       fire55 &
$RUNFDS Flowfields helium_2d                      fire56 &
$RUNFDS Flowfields jet_fan                        fire57 &
$RUNFDS Flowfields sawtooth                       fire58 &
$RUNFDS Flowfields tangential_velocity            fire59 &
$RUNFDS Heat_Transfer adiabatic_net_flux          fire51 &
$RUNFDS Heat_Transfer heat_conduction_a           fire52 &
$RUNFDS Heat_Transfer heat_conduction_b           fire53 &
$RUNFDS Heat_Transfer heat_conduction_c           fire54 &
$RUNFDS Heat_Transfer heat_conduction_d           fire55 &
$RUNFDS Heat_Transfer heat_conduction_kc          fire56 &
$RUNFDS Heat_Transfer insulated_steel_column      fire57 &
$RUNFDS Miscellaneous pyramid                     fire58 &
$RUNFDS Flowfields moody_dpdx=-0p01_N16           fire70 &
$RUNFDS Flowfields moody_dpdx=-0p01_N32           fire70 &
$RUNFDS Flowfields moody_dpdx=-0p01_N8            fire71 &
$RUNFDS Flowfields moody_dpdx=-100_N16            fire71 &
$RUNFDS Flowfields moody_dpdx=-100_N32            fire72 &
$RUNFDS Flowfields moody_dpdx=-100_N8             fire72 &
$RUNFDS Flowfields moody_dpdx=-1_N16              fire73 &
$RUNFDS Flowfields moody_dpdx=-1_N32              fire73 &
$RUNFDS Flowfields moody_dpdx=-1_N8               fire74 &
$RUNFDS NS_Analytical_Solution ns2d_16            fire59 &
$RUNFDS NS_Analytical_Solution ns2d_16_nupt1      fire61 &
$RUNFDS NS_Analytical_Solution ns2d_32            fire62 &
$RUNFDS NS_Analytical_Solution ns2d_32_nupt1      fire63 &
$RUNFDS NS_Analytical_Solution ns2d_64            fire64 &
$RUNFDS NS_Analytical_Solution ns2d_64_nupt1      fire65 &
$RUNFDS NS_Analytical_Solution ns2d_8             fire66 &
$RUNFDS NS_Analytical_Solution ns2d_8_nupt1       fire67 &
$RUNFDS Flowfields poiseuille_N8_mu025            fire74 &
$RUNFDS Flowfields poiseuille_N16_mu025           fire75 &
$RUNFDS Flowfields poiseuille_N32_mu025           fire75 &
$RUNFDS Flowfields poiseuille_N64_mu025           fire76 &
$RUNFDS Flowfields poiseuille_N64_mu0125          fire76 &
$RUNFDS Decaying_Isotropic_Turbulence mu0_32      fire77 &
$RUNFDS Decaying_Isotropic_Turbulence csmag0_32   fire77 &
$RUNFDS Decaying_Isotropic_Turbulence csmag_32    fire77 &
$RUNFDS Decaying_Isotropic_Turbulence csmag_64    fire77 &
$RUNFDS Decaying_Isotropic_Turbulence dsmag_32    fire78 &
$RUNFDS Decaying_Isotropic_Turbulence dsmag_64    fire78 &
$RUNFDS Pressure_Effects door_crack               fire68 &
$RUNFDS Pressure_Effects fan_test                 fire61 &
$RUNFDS Pressure_Effects leak_test_2              fire62 &
$RUNFDS Pressure_Effects leak_test                fire63 &
$RUNFDS Pressure_Effects pressure_boundary        fire64 &
$RUNFDS Pressure_Effects pressure_rise            fire65 &
$RUNFDS Pressure_Effects zone_break               fire66 &
$RUNFDS Pressure_Effects zone_shape               fire67 &
$RUNFDS Pyrolysis birch_tga_1step_2               fire68 &
$RUNFDS Pyrolysis birch_tga_1step_20              fire68 &
$RUNFDS Pyrolysis charring_solid                  fire68 &
$RUNFDS Pyrolysis enthalpy                        fire51 &
$RUNFDS Pyrolysis pyrolysis_1                     fire51 &
$RUNFDS Pyrolysis pyrolysis_2                     fire51 &
$RUNFDS Pyrolysis specified_hrr                   fire52 &
$RUNFDS Pyrolysis thermoplastic                   fire53 &
$RUNFDS Pyrolysis two_step_solid_reaction         fire54 &
$RUNFDS Radiation emissivity                      fire55 &
$RUNFDS Radiation radiation_box_100_1000          fire56 &
$RUNFDS Radiation radiation_box_100__100          fire57 &
$RUNFDS Radiation radiation_box_100_2000          fire58 &
$RUNFDS Radiation radiation_box_100__300          fire59 &
$RUNFDS Radiation radiation_box_100___50          fire41 &
$RUNFDS Radiation radiation_box__20_1000          fire41 &
$RUNFDS Radiation radiation_box__20__100          fire42 &
$RUNFDS Radiation radiation_box__20_2000          fire42 &
$RUNFDS Radiation radiation_box__20__300          fire43 &
$RUNFDS Radiation radiation_box__20___50          fire43 &
$RUNFDS Radiation radiation_plane_layer_1_1       fire44 &
$RUNFDS Radiation radiation_plane_layer_1_2       fire44 &
$RUNFDS Radiation radiation_plane_layer_1_3       fire45 &
$RUNFDS Radiation radiation_plane_layer_1_4       fire45 &
$RUNFDS Radiation radiation_plane_layer_1_5       fire46 &
$RUNFDS Radiation radiation_plane_layer_2_1       fire46 &
$RUNFDS Radiation radiation_plane_layer_2_2       fire47 &
$RUNFDS Radiation radiation_plane_layer_2_3       fire47 &
$RUNFDS Radiation radiation_plane_layer_2_4       fire41 &
$RUNFDS Radiation radiation_plane_layer_2_5       fire41 &
$RUNFDS Radiation radiation_plane_layer_3_1       fire42 &
$RUNFDS Radiation radiation_plane_layer_3_2       fire42 &
$RUNFDS Radiation radiation_plane_layer_3_3       fire43 &
$RUNFDS Radiation radiation_plane_layer_3_4       fire43 &
$RUNFDS Radiation radiation_plane_layer_3_5       fire44 &
$RUNFDS Radiation radiation_plane_layer_4_1       fire44 &
$RUNFDS Radiation radiation_plane_layer_4_2       fire45 &
$RUNFDS Radiation radiation_plane_layer_4_3       fire45 &
$RUNFDS Radiation radiation_plane_layer_4_4       fire41 &
$RUNFDS Radiation radiation_plane_layer_4_5       fire41 &
$RUNFDS Radiation radiation_plane_layer_5_1       fire42 &
$RUNFDS Radiation radiation_plane_layer_5_2       fire42 &
$RUNFDS Radiation radiation_plane_layer_5_3       fire43 &
$RUNFDS Radiation radiation_plane_layer_5_4       fire43 &
$RUNFDS Radiation radiation_plane_layer_5_5       fire44 &
$RUNFDS Radiation radiation_plane_layer_6_1       fire44 &
$RUNFDS Radiation radiation_plane_layer_6_2       fire45 &
$RUNFDS Radiation radiation_plane_layer_6_3       fire45 &
$RUNFDS Radiation radiation_plane_layer_6_4       fire51 &
$RUNFDS Radiation radiation_plane_layer_6_5       fire51 &
$RUNFDS Radiation wall_internal_radiation         fire52 &
$RUNFDS Species FED_Device                        fire52 &
$RUNFDS Sprinklers_and_Sprays activate_sprinklers fire52 &
$RUNFDS Sprinklers_and_Sprays bucket_test_2       fire53 &
$RUNFDS Sprinklers_and_Sprays bucket_test         fire53 &
$RUNFDS Sprinklers_and_Sprays cascade             fire54 &
$RUNFDS Sprinklers_and_Sprays droplet_flux        fire54 &
$RUNFDS Sprinklers_and_Sprays fuel_evaporation    fire55 &
$RUNFDS Sprinklers_and_Sprays particle_colors     fire55 &
$RUNFDS Sprinklers_and_Sprays water_cooling       fire56 &
$RUNFDS Sprinklers_and_Sprays water_evaporation   fire56 &
$RUNFDS Sprinklers_and_Sprays water_fuel_sprays   fire57 &
$RUNFDS Visualization centered_hrr_time           fire41 &
$RUNFDS Visualization colorbar                    fire41 &
$RUNFDS Visualization colorconv                   fire41 &
$RUNFDS Visualization colorconv_large             fire41 &
$RUNFDS Visualization devices_elem                fire42 &
$RUNFDS Visualization lt1                         fire42 &
$RUNFDS Visualization lt2                         fire42 &
$RUNFDS Visualization plume5a                     fire42 &
$RUNFDS Visualization plume5b                     fire43 &
$RUNFDS Visualization plume5c_bounddef            fire43 &
$RUNFDS Visualization plume5c                     fire43 &
$RUNFDS Visualization plume5_large                fire43 &
$RUNFDS Visualization plume5_large_part           fire44 &
$RUNFDS Visualization pplume5                     fire44 &
$RUNFDS Visualization pthouse5                    fire44 &
$RUNFDS Visualization script_slice_test           fire44 &
$RUNFDS Visualization script_test                 fire45 &
$RUNFDS Visualization sillytexture                fire45 &
$RUNFDS Visualization smoke_sensor                fire45 &
$RUNFDS Visualization smoke_test2                 fire45 &
$RUNFDS Visualization smoke_test                  fire46 &
$RUNFDS Visualization smooth_test2                fire46 &
$RUNFDS Visualization smooth_test3                fire46 &
$RUNFDS Visualization smooth_test                 fire46 &
$RUNFDS Visualization sprinkler_many              fire47 &
$RUNFDS Visualization stereo_test                 fire47 &
$RUNFDS Visualization thouse5                     fire47 &
$RUNFDS Visualization threshold                   fire47 &
$RUNFDS Visualization thresholdm                  fire47 &
$RUNFDS Visualization transparency                fire47 &
$RUNFDS Wui brand2                                fire51 &
$RUNFDS Wui brand                                 fire51 &
$RUNFDS Wui fire_line                             fire51 &
$RUNFDS Wui fire_line.ini                         fire51 &
$RUNFDS Wui fire_line.ssf                         fire52 &
$RUNFDS Wui tree_line                             fire52 &
$RUNFDS Wui tree_many                             fire52 &
$RUNFDS Wui tree_one                              fire53 &

echo FDS cases submitted

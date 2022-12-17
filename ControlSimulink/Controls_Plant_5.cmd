! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = off  &
   grid_visibility = off  &
   size_of_icons = 20.0  &
   spacing_for_grid = 1000.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.controls
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Chebyshev
!
model attributes  &
   model_name = .Chebyshev  &
   size_of_icons = 20.0
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create variable  &
   variable_name = .Chebyshev.WR  &
   adams_id = 33  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .Chebyshev.theta  &
   adams_id = 2  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .Chebyshev.omega  &
   adams_id = 3  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .Chebyshev.matlab_torque  &
   adams_id = 32  &
   initial_condition = 0.0  &
   function = ""
!
data_element create variable  &
   variable_name = .Chebyshev.WL  &
   adams_id = 34  &
   initial_condition = 0.0  &
   function = ""
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Chebyshev.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_O  &
   adams_id = 1  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_O  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_H  &
   adams_id = 2  &
   location = 631.75, 81.171, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_H  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_G  &
   adams_id = 3  &
   location = 592.06, 122.95, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_G  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_F  &
   adams_id = 4  &
   location = 679.87, 13.907, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_F  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_E  &
   adams_id = 5  &
   location = 559.89, 11.621, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_E  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_D  &
   adams_id = 6  &
   location = -50.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_D  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_P  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_P  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_20  &
   adams_id = 20  &
   location = 0.0, 0.0, -4.5E-02  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_20  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_33  &
   adams_id = 33  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_33  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_35  &
   adams_id = 35  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_35  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_SS  &
   adams_id = 161  &
   location = -225.53, 260.44, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_BB  &
   adams_id = 49  &
   location = -654.75, 67.869, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_BB  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_R  &
   adams_id = 50  &
   location = 107.19, 621.21, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_R  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_OOOO  &
   adams_id = 51  &
   location = -599.72, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_OOOO  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_61  &
   adams_id = 61  &
   location = -599.72, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_61  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_A  &
   adams_id = 64  &
   location = 684.85, 104.26, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_A  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_B  &
   adams_id = 65  &
   location = 1314.5, 83.28, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_B  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_OO  &
   adams_id = 66  &
   location = 1250.3, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_OO  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_RR  &
   adams_id = 67  &
   location = 774.47, 260.91, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.POINT_RR  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_76  &
   adams_id = 76  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_76  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_83  &
   adams_id = 83  &
   location = 1250.3, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.ground.MARKER_83  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.ground.MARKER_170  &
   adams_id = 170  &
   location = 377.5048657776, 1075.5994485644, 17.2873825349  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.trash  &
   adams_id = 171  &
   location = 559.89, 11.621, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.POINT_S  &
   adams_id = 151  &
   location = 1107.1, 635.39, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.trash2  &
   adams_id = 172  &
   location = 679.87, 13.907, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.trash3  &
   adams_id = 173  &
   location = 684.85, 104.26, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.trash4  &
   adams_id = 174  &
   location = 0.0, 0.0, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.ground.trash5  &
   adams_id = 175  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part attributes  &
   part_name = .Chebyshev.ground  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_CHEB_1 ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_1  &
   adams_id = 2  &
   location = 0.0, 0.0, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_8  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 123.690067526d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_8  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_9  &
   adams_id = 9  &
   location = -50.0, 0.0, 0.0  &
   orientation = 123.690067526d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_9  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.cm  &
   adams_id = 36  &
   location = -25.0, 0.0, 0.0  &
   orientation = 63.4349488229d, 89.9999999813d, 7.9990194173E-06d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_22  &
   adams_id = 22  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_22  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_56  &
   adams_id = 56  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_56  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_98  &
   adams_id = 98  &
   location = 0.0, 0.0, 10.0  &
   orientation = 162.067195888d, 78.7461583406d, 257.8217070842d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_98  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_145  &
   adams_id = 145  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_146  &
   adams_id = 146  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_147  &
   adams_id = 147  &
   location = -50.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_1  &
   mass = 9.3244435395E-02  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_1.cm  &
   ixx = 111.9171914436  &
   iyy = 111.9040215156  &
   izz = 1.540903989  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_1.LINK_1  &
   i_marker = .Chebyshev.BAR_CHEB_1.MARKER_8  &
   j_marker = .Chebyshev.BAR_CHEB_1.MARKER_9  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_1  &
   color = DkRed  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_CHEB_2 ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_2  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_10  &
   adams_id = 10  &
   location = -50.0, 0.0, 0.0  &
   orientation = 180.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_10  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_11  &
   adams_id = 11  &
   location = 679.87, 13.907, 0.0  &
   orientation = 180.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_11  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.cm  &
   adams_id = 37  &
   location = 314.935, 6.9535, 0.0  &
   orientation = 75.9637565321d, 89.9999999935d, 4.1605534713E-05d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_23  &
   adams_id = 23  &
   location = -50.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_23  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_24  &
   adams_id = 24  &
   location = 559.89, 11.621, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_24  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_26  &
   adams_id = 26  &
   location = 679.87, 13.907, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_26  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_2  &
   mass = 0.3276700738  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_2.cm  &
   ixx = 4820.7436640167  &
   iyy = 4820.7304940987  &
   izz = 5.4479979523  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_2.LINK_2  &
   i_marker = .Chebyshev.BAR_CHEB_2.MARKER_10  &
   j_marker = .Chebyshev.BAR_CHEB_2.MARKER_11  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_2  &
   color = Gray  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!-------------------------------- BAR_CHEB_4A ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_4A  &
   adams_id = 4  &
   location = 0.0, 0.0, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_4A
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_12  &
   adams_id = 12  &
   location = 679.87, 13.907, 0.0  &
   orientation = 315.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_12  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_13  &
   adams_id = 13  &
   location = 592.06, 122.95, 0.0  &
   orientation = 315.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_13  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4A.cm  &
   adams_id = 38  &
   location = 635.965, 68.4285, 0.0  &
   orientation = 45.0d, 90.0000000151d, 359.9999752012d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4A.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_27  &
   adams_id = 27  &
   location = 679.87, 13.907, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_27  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_28  &
   adams_id = 28  &
   location = 592.06, 122.95, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_28  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_4A  &
   mass = 0.1715108039  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_4A.cm  &
   ixx = 692.5219279304  &
   iyy = 692.5087580077  &
   izz = 2.8453434594  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_4A.LINK_3  &
   i_marker = .Chebyshev.BAR_CHEB_4A.MARKER_12  &
   j_marker = .Chebyshev.BAR_CHEB_4A.MARKER_13  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_4A  &
   color = Gray  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!-------------------------------- BAR_CHEB_5A ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_5A  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_5A
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_157  &
   adams_id = 157  &
   location = 630.28, 111.13, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_14  &
   adams_id = 14  &
   location = 592.06, 122.95, 0.0  &
   orientation = 225.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_14  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_15  &
   adams_id = 15  &
   location = 630.28, 111.13, 0.0  &
   orientation = 225.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_15  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.cm  &
   adams_id = 39  &
   location = 611.17, 117.04, 0.0  &
   orientation = 315.0d, 90.000000003d, 359.9999989351d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5A.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_29  &
   adams_id = 29  &
   location = 592.06, 122.95, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_29  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_32  &
   adams_id = 32  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_32  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_5A  &
   mass = 6.1188003933E-02  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_5A.cm  &
   ixx = 31.9609817914  &
   iyy = 31.9478118605  &
   izz = 1.0066301342  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_5A.LINK_4  &
   i_marker = .Chebyshev.BAR_CHEB_5A.MARKER_14  &
   j_marker = .Chebyshev.BAR_CHEB_5A.MARKER_15  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_5A  &
   color = Gray  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!-------------------------------- BAR_CHEB_4B ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_4B  &
   adams_id = 6  &
   location = 0.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_4B
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_16  &
   adams_id = 16  &
   location = 559.89, 11.621, 0.0  &
   orientation = 225.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_16  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_17  &
   adams_id = 17  &
   location = 631.75, 81.171, 0.0  &
   orientation = 225.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_17  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4B.cm  &
   adams_id = 40  &
   location = 595.82, 46.396, 0.0  &
   orientation = 123.690067526d, 89.9999999809d, 2.1507707861E-05d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4B.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_25  &
   adams_id = 25  &
   location = 559.89, 11.621, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_25  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_30  &
   adams_id = 30  &
   location = 631.75, 81.171, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_30  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_4B  &
   mass = 0.1466611314  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_4B.cm  &
   ixx = 433.397112715  &
   iyy = 433.3839427917  &
   izz = 2.4311822516  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_4B.LINK_5  &
   i_marker = .Chebyshev.BAR_CHEB_4B.MARKER_16  &
   j_marker = .Chebyshev.BAR_CHEB_4B.MARKER_17  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_4B  &
   color = Gray  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!-------------------------------- BAR_CHEB_5B ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_CHEB_5B  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_CHEB_5B
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_158  &
   adams_id = 158  &
   location = 630.28, 111.13, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_18  &
   adams_id = 18  &
   location = 631.75, 81.171, 0.0  &
   orientation = 315.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_18  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_19  &
   adams_id = 19  &
   location = 630.28, 111.13, 0.0  &
   orientation = 315.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_19  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.cm  &
   adams_id = 41  &
   location = 631.015, 96.1505, 0.0  &
   orientation = 45.0d, 90.000000003d, 359.9999989351d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5B.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_31  &
   adams_id = 31  &
   location = 631.75, 81.171, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_31  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_34  &
   adams_id = 34  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_34  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_160  &
   adams_id = 160  &
   location = 630.28, 111.13, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_CHEB_5B  &
   mass = 6.1188003933E-02  &
   center_of_mass_marker = .Chebyshev.BAR_CHEB_5B.cm  &
   ixx = 31.9609817914  &
   iyy = 31.9478118605  &
   izz = 1.0066301342  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_CHEB_5B.LINK_6  &
   i_marker = .Chebyshev.BAR_CHEB_5B.MARKER_18  &
   j_marker = .Chebyshev.BAR_CHEB_5B.MARKER_19  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_CHEB_5B  &
   color = Gray  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BR_4 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BR_4  &
   adams_id = 25  &
   location = 82.3, -252.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BR_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_162  &
   adams_id = 162  &
   location = 692.17, 512.91, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_163  &
   adams_id = 163  &
   location = -307.83, 512.44, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_4.cm  &
   adams_id = 166  &
   location = 192.17, 512.675, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_164  &
   adams_id = 164  &
   location = 692.17, 512.91, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BR_4  &
   mass = 1.6502632079  &
   center_of_mass_marker = .Chebyshev.BAR_4BR_4.cm  &
   ixx = 1.5391442738E+05  &
   iyy = 1.5387314446E+05  &
   izz = 68.7346257975  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BR_4.LINK_38  &
   i_marker = .Chebyshev.BAR_4BR_4.MARKER_162  &
   j_marker = .Chebyshev.BAR_4BR_4.MARKER_163  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BR_4  &
   color = LimeGreen  &
   name_visibility = off
!
!--------------------------------- BAR_4BL_2 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BL_2  &
   adams_id = 9  &
   location = 0.0, 0.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BL_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_52  &
   adams_id = 52  &
   location = -50.0, 0.0, 0.0  &
   orientation = 194.0362434679d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_52  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_53  &
   adams_id = 53  &
   location = -654.75, 67.869, 0.0  &
   orientation = 194.0362434679d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_53  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_2.cm  &
   adams_id = 62  &
   location = -352.375, 33.9345, 0.0  &
   orientation = 116.5650511771d, 90.0000000197d, 359.9999998518d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_2.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_57  &
   adams_id = 57  &
   location = -50.0, 0.0, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_57  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_58  &
   adams_id = 58  &
   location = -654.75, 67.869, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_58  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BL_2  &
   mass = 0.7097958596  &
   center_of_mass_marker = .Chebyshev.BAR_4BL_2.cm  &
   ixx = 1.2266783015E+04  &
   iyy = 1.2249011779E+04  &
   izz = 29.5484874335  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BL_2.LINK_8  &
   i_marker = .Chebyshev.BAR_4BL_2.MARKER_52  &
   j_marker = .Chebyshev.BAR_4BL_2.MARKER_53  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BL_2  &
   color = DkRed  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BL_3 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BL_3  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BL_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_54  &
   adams_id = 54  &
   location = -654.75, 67.869, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_54  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_55  &
   adams_id = 55  &
   location = 107.19, 621.21, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_55  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.cm  &
   adams_id = 63  &
   location = -273.78, 344.5395, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_3.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_59  &
   adams_id = 59  &
   location = -654.75, 67.869, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_59  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_60  &
   adams_id = 60  &
   location = -599.72, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_60  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_144  &
   adams_id = 144  &
   location = -129.75, 2.5, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_156  &
   adams_id = 156  &
   location = 107.19, 621.21, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BL_3  &
   mass = 0.4801132079  &
   center_of_mass_marker = .Chebyshev.BAR_4BL_3.cm  &
   ixx = 3805.3351500456  &
   iyy = 3793.3059799911  &
   izz = 19.9783771279  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BL_3.LINK_9  &
   i_marker = .Chebyshev.BAR_4BL_3.MARKER_54  &
   j_marker = .Chebyshev.BAR_4BL_3.MARKER_55  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BL_3  &
   color = DkRed  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BR_2 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BR_2  &
   adams_id = 11  &
   location = 0.0, 0.0, -10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BR_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_68  &
   adams_id = 68  &
   location = 684.85, 104.26, 0.0  &
   orientation = 347.4711922908d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_68  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_69  &
   adams_id = 69  &
   location = 1314.5, 83.28, 0.0  &
   orientation = 347.4711922908d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_69  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_2.cm  &
   adams_id = 84  &
   location = 999.675, 93.77, 0.0  &
   orientation = 77.4711922908d, 89.999999986d, 1.424781264E-07d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_2.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_79  &
   adams_id = 79  &
   location = 684.85, 104.26, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_79  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_80  &
   adams_id = 80  &
   location = 1314.5, 83.28, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_80  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BR_2  &
   mass = 0.731269871  &
   center_of_mass_marker = .Chebyshev.BAR_4BR_2.cm  &
   ixx = 1.3412598446E+04  &
   iyy = 1.3394290359E+04  &
   izz = 30.4432379542  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BR_2.LINK_10  &
   i_marker = .Chebyshev.BAR_4BR_2.MARKER_68  &
   j_marker = .Chebyshev.BAR_4BR_2.MARKER_69  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BR_2  &
   color = NiceGreen  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BR_3 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BR_3  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BR_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_70  &
   adams_id = 70  &
   location = 1314.5, 83.28, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_70  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_71  &
   adams_id = 71  &
   location = 774.47, 260.91, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_71  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.cm  &
   adams_id = 85  &
   location = 1044.485, 172.095, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_3.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_165  &
   adams_id = 165  &
   location = 774.47, 260.91, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_81  &
   adams_id = 81  &
   location = 1314.5, 83.28, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_81  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_82  &
   adams_id = 82  &
   location = 1250.3, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_82  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BR_3  &
   mass = 0.5581232079  &
   center_of_mass_marker = .Chebyshev.BAR_4BR_3.cm  &
   ixx = 5971.1507298553  &
   iyy = 5957.1713098893  &
   izz = 23.228793706  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BR_3.LINK_11  &
   i_marker = .Chebyshev.BAR_4BR_3.MARKER_70  &
   j_marker = .Chebyshev.BAR_4BR_3.MARKER_71  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BR_3  &
   color = NiceGreen  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BR_1 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BR_1  &
   adams_id = 13  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BR_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_159  &
   adams_id = 159  &
   location = 630.28, 111.13, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_72  &
   adams_id = 72  &
   location = 684.85, 104.26, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_72  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_73  &
   adams_id = 73  &
   location = 630.28, 111.13, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_73  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.cm  &
   adams_id = 86  &
   location = 657.565, 107.695, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_1.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_77  &
   adams_id = 77  &
   location = 630.28, 111.13, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_77  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_78  &
   adams_id = 78  &
   location = 684.85, 104.26, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_78  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BR_1  &
   mass = 0.1680732079  &
   center_of_mass_marker = .Chebyshev.BAR_4BR_1.cm  &
   ixx = 168.36292877  &
   iyy = 164.134758718  &
   izz = 6.9767104588  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BR_1.LINK_12  &
   i_marker = .Chebyshev.BAR_4BR_1.MARKER_72  &
   j_marker = .Chebyshev.BAR_4BR_1.MARKER_73  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BR_1  &
   color = NiceGreen  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- windshield ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.windshield  &
   adams_id = 26  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.windshield
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.windshield.MARKER_167  &
   adams_id = 167  &
   location = -1099.7, 211.13, -20.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.windshield.cm  &
   adams_id = 168  &
   location = 150.3, 1061.13, -19.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Chebyshev.windshield.MARKER_169  &
   adams_id = 169  &
   location = 377.5048657776, 1075.5994485644, 17.2873825349  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.windshield  &
   material_type = .Chebyshev.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .Chebyshev.windshield.BOX_39  &
   adams_id = 39  &
   corner_marker = .Chebyshev.windshield.MARKER_167  &
   diag_corner_coords = 2500.0, 1700.0, 2.0
!
geometry attributes  &
   geometry_name = .Chebyshev.windshield.BOX_39  &
   color = CYAN  &
   transparency = 80
!
part attributes  &
   part_name = .Chebyshev.windshield  &
   color = MAIZE  &
   name_visibility = off
!
!---------------------------------- m_shaft -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.m_shaft  &
   adams_id = 15  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.m_shaft
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER_21  &
   adams_id = 21  &
   location = 0.0, 0.0, -4.5E-02  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.m_shaft.MARKER_21  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER_176  &
   adams_id = 176  &
   location = 0.0, 0.0, -15.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER_177  &
   adams_id = 177  &
   location = 0.0, 0.0, -15.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER_96  &
   adams_id = 96  &
   location = 0.0, 0.0, -15.0  &
   orientation = 270.0d, 180.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.m_shaft.MARKER_96  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.m_shaft.cm  &
   adams_id = 99  &
   location = 0.0, 0.0, -2.0E-02  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.m_shaft.cm  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER_97  &
   adams_id = 97  &
   location = 0.0, 0.0, 0.0  &
   orientation = 162.067195888d, 78.7461583406d, 257.8217070842d
!
marker attributes  &
   marker_name = .Chebyshev.m_shaft.MARKER_97  &
   size_of_icons = 20.0
!
marker create  &
   marker_name = .Chebyshev.m_shaft.MARKER  &
   adams_id = 114  &
   location = 0.0, 0.0, -2.0E-02  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Chebyshev.m_shaft.MARKER  &
   size_of_icons = 20.0
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.m_shaft  &
   mass = 2.4507564291E-02  &
   center_of_mass_marker = .Chebyshev.m_shaft.MARKER  &
   ixx = 3.4208475156  &
   iyy = 3.4208475156  &
   izz = 0.3063445536  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Chebyshev.m_shaft.CYLINDER_14  &
   adams_id = 14  &
   center_marker = .Chebyshev.m_shaft.MARKER_96  &
   angle_extent = 360.0  &
   length = 25.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Chebyshev.m_shaft  &
   color = DkYellow  &
   name_visibility = off  &
   size_of_icons = 20.0
!
!--------------------------------- BAR_4BL_4 ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
part create rigid_body name_and_position  &
   part_name = .Chebyshev.BAR_4BL_4  &
   adams_id = 24  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.BAR_4BL_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_152  &
   adams_id = 152  &
   location = 107.19, 621.21, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_153  &
   adams_id = 153  &
   location = 1107.1, 635.39, 0.0  &
   orientation = 270.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_4.cm  &
   adams_id = 154  &
   location = 607.145, 628.3, 0.0  &
   orientation = 89.9999999989d, 89.9999999896d, 6.1841645602d
!
marker create  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_155  &
   adams_id = 155  &
   location = 107.19, 621.21, 0.0  &
   orientation = 3.0664320961d, 6.1929629718d, 355.375396067d
!
part create rigid_body mass_properties  &
   part_name = .Chebyshev.BAR_4BL_4  &
   mass = 0.1368692079  &
   center_of_mass_marker = .Chebyshev.BAR_4BL_4.cm  &
   ixx = 92.5194352979  &
   iyy = 89.0713652428  &
   izz = 5.6765437952  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Chebyshev.BAR_4BL_4.LINK_37  &
   i_marker = .Chebyshev.BAR_4BL_4.MARKER_152  &
   j_marker = .Chebyshev.BAR_4BL_4.MARKER_153  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .Chebyshev.BAR_4BL_4  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Chebyshev.ground.MARKER_20  &
   j_marker_name = .Chebyshev.m_shaft.MARKER_21
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_1  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Chebyshev.BAR_CHEB_1.MARKER_22  &
   j_marker_name = .Chebyshev.BAR_CHEB_2.MARKER_23
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_2  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Chebyshev.BAR_CHEB_2.MARKER_24  &
   j_marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_25
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_3  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Chebyshev.BAR_CHEB_2.MARKER_26  &
   j_marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_27
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_4  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_28  &
   j_marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_29
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_5  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_30  &
   j_marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_31
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_6  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_32  &
   j_marker_name = .Chebyshev.ground.MARKER_33
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_7  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_34  &
   j_marker_name = .Chebyshev.ground.MARKER_35
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_8  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_29  &
   adams_id = 29  &
   i_marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_157  &
   j_marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_158
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_29  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_30  &
   adams_id = 30  &
   i_marker_name = .Chebyshev.BAR_4BR_1.MARKER_159  &
   j_marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_160
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_30  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_11  &
   adams_id = 11  &
   i_marker_name = .Chebyshev.BAR_CHEB_1.MARKER_56  &
   j_marker_name = .Chebyshev.BAR_4BL_2.MARKER_57
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_11  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_12  &
   adams_id = 12  &
   i_marker_name = .Chebyshev.BAR_4BL_2.MARKER_58  &
   j_marker_name = .Chebyshev.BAR_4BL_3.MARKER_59
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_12  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_13  &
   adams_id = 13  &
   i_marker_name = .Chebyshev.BAR_4BL_3.MARKER_60  &
   j_marker_name = .Chebyshev.ground.MARKER_61
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_13  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_14  &
   adams_id = 14  &
   i_marker_name = .Chebyshev.ground.MARKER_76  &
   j_marker_name = .Chebyshev.BAR_4BR_1.MARKER_77
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_14  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_15  &
   adams_id = 15  &
   i_marker_name = .Chebyshev.BAR_4BR_1.MARKER_78  &
   j_marker_name = .Chebyshev.BAR_4BR_2.MARKER_79
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_15  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_16  &
   adams_id = 16  &
   i_marker_name = .Chebyshev.BAR_4BR_2.MARKER_80  &
   j_marker_name = .Chebyshev.BAR_4BR_3.MARKER_81
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_16  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint revolute  &
   joint_name = .Chebyshev.JOINT_17  &
   adams_id = 17  &
   i_marker_name = .Chebyshev.BAR_4BR_3.MARKER_82  &
   j_marker_name = .Chebyshev.ground.MARKER_83
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_17  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_31  &
   adams_id = 31  &
   i_marker_name = .Chebyshev.BAR_4BR_4.MARKER_164  &
   j_marker_name = .Chebyshev.BAR_4BR_3.MARKER_165
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_31  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_32  &
   adams_id = 32  &
   i_marker_name = .Chebyshev.windshield.MARKER_169  &
   j_marker_name = .Chebyshev.ground.MARKER_170
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_32  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_20  &
   adams_id = 20  &
   i_marker_name = .Chebyshev.m_shaft.MARKER_97  &
   j_marker_name = .Chebyshev.BAR_CHEB_1.MARKER_98
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_20  &
   name_visibility = off  &
   size_of_icons = 20.0
!
constraint create joint fixed  &
   joint_name = .Chebyshev.JOINT_28  &
   adams_id = 28  &
   i_marker_name = .Chebyshev.BAR_4BL_4.MARKER_155  &
   j_marker_name = .Chebyshev.BAR_4BL_3.MARKER_156
!
constraint attributes  &
   constraint_name = .Chebyshev.JOINT_28  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create direct single_component_force  &
   single_component_force_name = .Chebyshev.SFORCE_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   i_marker_name = .Chebyshev.m_shaft.MARKER_176  &
   j_marker_name = .Chebyshev.m_shaft.MARKER_177  &
   action_only = on  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Chebyshev.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=15.0 step_size=5.0E-03 model_name=.Chebyshev"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .Chebyshev.THETAD_D  &
   definition_name = .MDI.Acontrols.controls_input  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.Controls_Plant_2  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.THETAD_A  &
   definition_name = .MDI.Acontrols.controls_input  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.SUM  &
   definition_name = .MDI.Acontrols.controls_sum  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.GAINN  &
   definition_name = .MDI.Acontrols.controls_gain  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.PIDCON  &
   definition_name = .MDI.Acontrols.controls_pid  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.Controls_Plant_3  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.Controls_Plant_4  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Chebyshev.Controls_Plant_5  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.THETAD_D
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.input_channels  &
   object_value = .Chebyshev.matlab_torque
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.output_channels  &
   object_value =   &
      .Chebyshev.omega,  &
      .Chebyshev.theta,  &
      .Chebyshev.WL,  &
      .Chebyshev.WR,  &
      .Chebyshev.THETAD_A.THETAD_A_input
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.file_name  &
   string_value = "Controls_Plant_2"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.host  &
   string_value = "DESKTOP-9TSPNQ9.home"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.include_mnf  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.ude_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.expose_variant  &
   integer_value = 0
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_2.expose_event  &
   integer_value = 0
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.THETAD_A
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.SUM.input_obj  &
   object_value =   &
      .Chebyshev.THETAD_D,  &
      .Chebyshev.THETAD_A
!
variable modify  &
   variable_name = .Chebyshev.SUM.gain1  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Chebyshev.SUM.gain2  &
   real_value = -1.0
!
ude modify instance  &
   instance_name = .Chebyshev.SUM
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.GAINN.input_obj  &
   object_value = .Chebyshev.SUM
!
variable modify  &
   variable_name = .Chebyshev.GAINN.gain  &
   real_value = 1.0E+07
!
ude modify instance  &
   instance_name = .Chebyshev.GAINN
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.PIDCON.input_obj  &
   object_value =   &
      .Chebyshev.SUM,  &
      .Chebyshev.SUM
!
variable modify  &
   variable_name = .Chebyshev.PIDCON.p_gain  &
   real_value = 1.0E+07
!
variable modify  &
   variable_name = .Chebyshev.PIDCON.i_gain  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Chebyshev.PIDCON.d_gain  &
   real_value = 40.0
!
variable modify  &
   variable_name = .Chebyshev.PIDCON.initial_condition  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .Chebyshev.PIDCON
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.input_channels  &
   object_value = .Chebyshev.matlab_torque
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.output_channels  &
   object_value =   &
      .Chebyshev.omega,  &
      .Chebyshev.theta,  &
      .Chebyshev.WL,  &
      .Chebyshev.WR,  &
      .Chebyshev.THETAD_A.THETAD_A_input
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.file_name  &
   string_value = "Controls_Plant_3"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.host  &
   string_value = "DESKTOP-9TSPNQ9.home"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.include_mnf  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.ude_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.expose_variant  &
   integer_value = 0
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_3.expose_event  &
   integer_value = 0
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.input_channels  &
   object_value = .Chebyshev.matlab_torque
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.output_channels  &
   object_value =   &
      .Chebyshev.omega,  &
      .Chebyshev.theta,  &
      .Chebyshev.WL,  &
      .Chebyshev.WR,  &
      .Chebyshev.THETAD_A.THETAD_A_input
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.file_name  &
   string_value = "Controls_Plant_4"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.host  &
   string_value = "DESKTOP-9TSPNQ9.home"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.include_mnf  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.ude_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.expose_variant  &
   integer_value = 0
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_4.expose_event  &
   integer_value = 0
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_4
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.input_channels  &
   object_value = .Chebyshev.matlab_torque
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.output_channels  &
   object_value =   &
      .Chebyshev.omega,  &
      .Chebyshev.theta,  &
      .Chebyshev.WL,  &
      .Chebyshev.WR,  &
      .Chebyshev.THETAD_A.THETAD_A_input
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.file_name  &
   string_value = "Controls_Plant_5"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.host  &
   string_value = "DESKTOP-9TSPNQ9.home"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.include_mnf  &
   string_value = "no"
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.ude_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.expose_variant  &
   integer_value = 0
!
variable modify  &
   variable_name = .Chebyshev.Controls_Plant_5.expose_event  &
   integer_value = 0
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_5
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry create shape force  &
   force_name = .Chebyshev.SFORCE_1_force_graphic_1  &
   adams_id = 40  &
   force_element_name = .Chebyshev.SFORCE_1  &
   applied_at_marker_name = .Chebyshev.m_shaft.MARKER_176
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = .Chebyshev.gravity  &
   size_of_icons = 20.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create angle  &
   measure_name = .Chebyshev.LEFT_WIPER  &
   first_point = .Chebyshev.BAR_4BR_3.cm  &
   middle_point = .Chebyshev.ground.POINT_OO  &
   last_point = .Chebyshev.ground.POINT_RR
!
data_element attributes  &
   data_element_name = .Chebyshev.LEFT_WIPER  &
   color = WHITE
!
measure create angle  &
   measure_name = .Chebyshev.RIGHT_WIPER  &
   first_point = .Chebyshev.BAR_4BL_3.cm  &
   middle_point = .Chebyshev.ground.POINT_OOOO  &
   last_point = .Chebyshev.ground.POINT_R
!
data_element attributes  &
   data_element_name = .Chebyshev.RIGHT_WIPER  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Chebyshev.layout_config  &
   integer_value = 1
!
!---------------------------- Function definitions ----------------------------!
!
!
data_element modify variable  &
   variable_name = .Chebyshev.WR  &
   function = "AZ(.Chebyshev.BAR_4BR_3.cm,.Chebyshev.ground.POINT_OO)"
!
data_element modify variable  &
   variable_name = .Chebyshev.theta  &
   function = "AZ(.Chebyshev.BAR_CHEB_1.cm,.Chebyshev.ground.POINT_P)"
!
data_element modify variable  &
   variable_name = .Chebyshev.omega  &
   function = "WZ(.Chebyshev.BAR_CHEB_1.cm, .Chebyshev.ground.POINT_P, .Chebyshev.ground.POINT_P)"
!
data_element modify variable  &
   variable_name = .Chebyshev.matlab_torque  &
   function = "0"
!
data_element modify variable  &
   variable_name = .Chebyshev.WL  &
   function = "AZ(.Chebyshev.BAR_4BL_3.cm,.Chebyshev.ground.POINT_OOOO)"
!
force modify direct single_component_force  &
   single_component_force_name = .Chebyshev.SFORCE_1  &
   function = "-VARVAL(.Chebyshev.matlab_torque)"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
data_element modify variable  &
   variable_name = .Chebyshev.THETAD_D.THETAD_D_input  &
   function = "20"
!
ude modify instance  &
   instance_name = .Chebyshev.THETAD_D
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
data_element modify variable  &
   variable_name = .Chebyshev.THETAD_A.THETAD_A_input  &
   function = "WZ( .Chebyshev.m_shaft.cm)"
!
ude modify instance  &
   instance_name = .Chebyshev.THETAD_A
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.SUM
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.GAINN
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.PIDCON
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_4
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Chebyshev.Controls_Plant_5
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_20  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -4.5E-02}, .Chebyshev.ground.POINT_P))
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_33  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_35  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_61  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_OOOO))
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_76  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))
!
marker modify  &
   marker_name = .Chebyshev.ground.MARKER_83  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_OO))
!
marker modify  &
   marker_name = .Chebyshev.ground.trash  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_E))
!
marker modify  &
   marker_name = .Chebyshev.ground.trash2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_F))
!
marker modify  &
   marker_name = .Chebyshev.ground.trash3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_A))
!
marker modify  &
   marker_name = .Chebyshev.ground.trash4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_P))
!
marker modify  &
   marker_name = .Chebyshev.ground.trash5  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_D))
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_P))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_P) / 2 + LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_D) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_1.LINK_1  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_98  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_P))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_22  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_56  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_145  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_146  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_1.MARKER_147  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_10  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_F))  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_F) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_23  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_24  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_E))  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_2.MARKER_26  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_F))  &
   relative_to = .Chebyshev.BAR_CHEB_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_2.LINK_2  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_12  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_F))  &
   relative_to = .Chebyshev.BAR_CHEB_4A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_13  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_G))  &
   relative_to = .Chebyshev.BAR_CHEB_4A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4A.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_G) / 2 + LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_F) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_4A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_27  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_F))  &
   relative_to = .Chebyshev.BAR_CHEB_4A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4A.MARKER_28  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_G))  &
   relative_to = .Chebyshev.BAR_CHEB_4A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_4A.LINK_3  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_14  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_G))  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_15  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_G) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_29  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_G))  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_32  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_5A.LINK_4  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5A.MARKER_157  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5A
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_16  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_E))  &
   relative_to = .Chebyshev.BAR_CHEB_4B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_17  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_H))  &
   relative_to = .Chebyshev.BAR_CHEB_4B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4B.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_E) / 2 + LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_H) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_4B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_25  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_E))  &
   relative_to = .Chebyshev.BAR_CHEB_4B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_4B.MARKER_30  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_H))  &
   relative_to = .Chebyshev.BAR_CHEB_4B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_4B.LINK_5  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_18  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_H))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_19  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_H) / 2)  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_31  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_H))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_34  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_CHEB_5B.LINK_6  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_158  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_CHEB_5B.MARKER_160  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_CHEB_5B
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_52  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_4BL_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_53  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_BB))  &
   relative_to = .Chebyshev.BAR_4BL_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BL_2.LINK_8  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_2.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_D) / 2 + LOC_RELATIVE_TO({0, 0, 10}, .Chebyshev.ground.POINT_BB) / 2)  &
   relative_to = .Chebyshev.BAR_4BL_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_57  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_D))  &
   relative_to = .Chebyshev.BAR_4BL_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_2.MARKER_58  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_BB))  &
   relative_to = .Chebyshev.BAR_4BL_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_54  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_BB))  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_55  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R))  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BL_3.LINK_9  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_BB) / 2)  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_60  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_OOOO))  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_59  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_BB))  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_3.MARKER_156  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R))  &
   relative_to = .Chebyshev.BAR_4BL_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_68  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_A))  &
   relative_to = .Chebyshev.BAR_4BR_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_69  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_B))  &
   relative_to = .Chebyshev.BAR_4BR_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BR_2.LINK_10  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_2.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_A) / 2 + LOC_RELATIVE_TO({0, 0, -10}, .Chebyshev.ground.POINT_B) / 2)  &
   relative_to = .Chebyshev.BAR_4BR_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_79  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_A))  &
   relative_to = .Chebyshev.BAR_4BR_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_2.MARKER_80  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_B))  &
   relative_to = .Chebyshev.BAR_4BR_2
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_70  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_B))  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_71  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR))  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BR_3.LINK_11  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_B) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR) / 2)  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_81  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_B))  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_82  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_OO))  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_3.MARKER_165  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR))  &
   relative_to = .Chebyshev.BAR_4BR_3
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_72  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_A))  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_73  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BR_1.LINK_12  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_A) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O) / 2)  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_77  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_78  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_A))  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_1.MARKER_159  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_O))  &
   relative_to = .Chebyshev.BAR_4BR_1
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.m_shaft.MARKER_96  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -15}, .Chebyshev.ground.POINT_P))  &
   relative_to = .Chebyshev.m_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Chebyshev.m_shaft.CYLINDER_14  &
   length = (2.5cm)  &
   radius = (0.5cm)
!
marker modify  &
   marker_name = .Chebyshev.m_shaft.MARKER_97  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_P))  &
   relative_to = .Chebyshev.m_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.m_shaft.MARKER_21  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, -4.5E-02}, .Chebyshev.ground.POINT_P))  &
   relative_to = .Chebyshev.m_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.m_shaft.MARKER  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.m_shaft.cm))  &
   relative_to = .Chebyshev.m_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_152  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R))  &
   relative_to = .Chebyshev.BAR_4BL_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_153  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_S))  &
   relative_to = .Chebyshev.BAR_4BL_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BL_4.LINK_37  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_4.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_S) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R) / 2)  &
   relative_to = .Chebyshev.BAR_4BL_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BL_4.MARKER_155  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_R))  &
   relative_to = .Chebyshev.BAR_4BL_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_162  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR))  &
   relative_to = .Chebyshev.BAR_4BR_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_163  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_SS))  &
   relative_to = .Chebyshev.BAR_4BR_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape link  &
   link_name = .Chebyshev.BAR_4BR_4.LINK_38  &
   width = (1.0cm)  &
   depth = (1.0cm)
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_4.cm  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR) / 2 + LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_SS) / 2)  &
   relative_to = .Chebyshev.BAR_4BR_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
marker modify  &
   marker_name = .Chebyshev.BAR_4BR_4.MARKER_164  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Chebyshev.ground.POINT_RR))  &
   relative_to = .Chebyshev.BAR_4BR_4
!
defaults coordinate_system  &
   default_coordinate_system = .Chebyshev.ground
!
geometry modify shape block  &
   block_name = .Chebyshev.windshield.BOX_39  &
   diag_corner_coords =   &
      (250cm),  &
      (170cm),  &
      (2.0mm)
!
material modify  &
   material_name = .Chebyshev.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
geometry modify shape force  &
   force_name = .Chebyshev.SFORCE_1_force_graphic_1  &
   applied_at_marker_name = (.Chebyshev.SFORCE_1.i)
!
model display  &
   model_name = Chebyshev

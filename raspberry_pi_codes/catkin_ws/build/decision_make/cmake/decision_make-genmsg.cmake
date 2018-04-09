# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "decision_make: 3 messages, 0 services")

set(MSG_I_FLAGS "-Idecision_make:/home/magnam/catkin_ws/src/decision_make/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(decision_make_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_custom_target(_decision_make_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "decision_make" "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" ""
)

get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_custom_target(_decision_make_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "decision_make" "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" ""
)

get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_custom_target(_decision_make_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "decision_make" "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make
)
_generate_msg_cpp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make
)
_generate_msg_cpp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make
)

### Generating Services

### Generating Module File
_generate_module_cpp(decision_make
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(decision_make_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(decision_make_generate_messages decision_make_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_cpp _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_cpp _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_cpp _decision_make_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(decision_make_gencpp)
add_dependencies(decision_make_gencpp decision_make_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS decision_make_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make
)
_generate_msg_eus(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make
)
_generate_msg_eus(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make
)

### Generating Services

### Generating Module File
_generate_module_eus(decision_make
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(decision_make_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(decision_make_generate_messages decision_make_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_eus _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_eus _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_eus _decision_make_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(decision_make_geneus)
add_dependencies(decision_make_geneus decision_make_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS decision_make_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make
)
_generate_msg_lisp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make
)
_generate_msg_lisp(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make
)

### Generating Services

### Generating Module File
_generate_module_lisp(decision_make
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(decision_make_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(decision_make_generate_messages decision_make_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_lisp _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_lisp _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_lisp _decision_make_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(decision_make_genlisp)
add_dependencies(decision_make_genlisp decision_make_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS decision_make_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make
)
_generate_msg_nodejs(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make
)
_generate_msg_nodejs(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make
)

### Generating Services

### Generating Module File
_generate_module_nodejs(decision_make
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(decision_make_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(decision_make_generate_messages decision_make_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_nodejs _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_nodejs _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_nodejs _decision_make_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(decision_make_gennodejs)
add_dependencies(decision_make_gennodejs decision_make_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS decision_make_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make
)
_generate_msg_py(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make
)
_generate_msg_py(decision_make
  "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make
)

### Generating Services

### Generating Module File
_generate_module_py(decision_make
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(decision_make_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(decision_make_generate_messages decision_make_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/diagnose_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_py _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/ultrasonic_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_py _decision_make_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/magnam/catkin_ws/src/decision_make/msg/rpm_msg.msg" NAME_WE)
add_dependencies(decision_make_generate_messages_py _decision_make_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(decision_make_genpy)
add_dependencies(decision_make_genpy decision_make_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS decision_make_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/decision_make
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(decision_make_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(decision_make_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(decision_make_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/decision_make
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(decision_make_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(decision_make_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(decision_make_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/decision_make
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(decision_make_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(decision_make_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(decision_make_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/decision_make
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(decision_make_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(decision_make_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(decision_make_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/decision_make
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(decision_make_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(decision_make_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(decision_make_generate_messages_py std_msgs_generate_messages_py)
endif()

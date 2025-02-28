if (DEFINED ENV{BAREOS_KERNEL_PATH} AND (NOT BAREOS_KERNEL_PATH))
    set(BAREOS_KERNEL_PATH $ENV{BAREOS_KERNEL_PATH})
    message("Using BAREOS_KERNEL_PATH from environment ('${BAREOS_KERNEL_PATH}')")
endif ()

set(BAREOS_KERNEL_RP2040_RELATIVE_PATH "")
# undo the above
if (NOT EXISTS ${BAREOS_KERNEL_PATH})
    message(FATAL_ERROR "Directory '${BAREOS_KERNEL_PATH}' not found")
endif()
add_subdirectory(${BAREOS_KERNEL_PATH} BAREOS_KERNEL)
# Custom configs for BareOS
add_library(BAREOS_PORT INTERFACE)
target_include_directories(BAREOS_PORT
    INTERFACE
       ${BAREOS_CONFIG_FILE_DIRECTORY}
    )
    

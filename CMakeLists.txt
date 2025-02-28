cmake_minimum_required(VERSION 3.12)

# Change your executable name to something creative!
set(NAME PICO_BAREOS) # <-- Name your project/executable here!
# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)

project(pico_freertos C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --save-temps")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --save-temps")

set(PICO_BOARD pico_w) # Set the board used

# Set config files paths to be used
message(WARNING "FREE : ${BAREOS_KERNEL_PATH}")
# Initialize the SDK
pico_sdk_init()

# Initialize all other external libs & dependencies
include(BareOS_Kernel_import.cmake)

add_executable(${NAME}  
        blink.c
        )

# pull in common dependencies
target_link_libraries(${NAME} 
        pico_stdlib                                 # for core functionality
        pico_cyw43_arch_none  # we need Wifi
        BareOS-Kernel
        )
# Enable print functionality on usb & disable on uart
pico_enable_stdio_usb(${NAME}  1) 
pico_enable_stdio_uart(${NAME}  0)

# create map/bin/hex file etc.
pico_add_extra_outputs(${NAME} )

target_include_directories(${NAME}  
        PRIVATE ${CMAKE_CURRENT_LIST_DIR}
        )

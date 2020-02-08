'''
This module simply prints your OpenCL platforms and devices to screen.
'''

import os
import opencl4py as cl
os.environ["PYOPENCL_CTX"] = "0:0" # This is where you choose a device number

# Print all platforms and devices
platforms = cl.Platforms()
print(platforms.dump_devices())

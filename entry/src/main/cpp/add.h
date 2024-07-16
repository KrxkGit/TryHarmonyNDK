#ifndef TRYHARMONYNDK_ADD_H
#define TRYHARMONYNDK_ADD_H

#include "napi/native_api.h"

typedef napi_value (*AddWrapper)(napi_env, napi_callback_info);
AddWrapper getAddFunc();

#endif //TRYHARMONYNDK_ADD_H

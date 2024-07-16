#include "add.h"
#include <cstdint>

static int testStatic() {
    return 100;
}


static napi_value Add(napi_env env, napi_callback_info info)
{
    const size_t args_num = 3;
    const int a = testStatic();
    size_t argc = args_num;
    napi_value args[args_num] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    double value[args_num];
    for (int i = 0; i < args_num; i++) {
        napi_get_value_double(env, args[i], &value[i]);
    }

    double res = 0;
    for (int i = 0; i < args_num; i++) {
        res += value[i];
    }

    napi_value sum;
    napi_create_double(env, res + a, &sum);

    
    return sum;
}

AddWrapper getAddFunc()
{
    return Add;
}
#include "add.h"

static int testStatic() {
    return 100;
}

napi_value Add(napi_env env, napi_callback_info info)
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
    
    napi_handle_scope scope;
    napi_value temp;
    for (int i = 0; i < 1000000; i++) {
        napi_open_handle_scope(env, &scope);
        napi_create_int64(env, 100, &temp);
        napi_close_handle_scope(env, scope);
    }

    return sum;
}
#include <ruby.h>
#include <sys/kinfo.h>

VALUE AixFacterHelperModule = Qnil;

// Converts the given integer average into a load average.
static double to_load_avg(double average) {
  // 65536 is the load average scale on AIX machines.
  return average / 65536;
}


VALUE aixFacterHelper_getLoadAverages(VALUE self) {
  VALUE result = Qnil;
  long long averages[3];
  int buf_size = 3 * sizeof(long long);
  int rc = getkerninfo(KINFO_GET_AVENRUN, (char*)averages, &buf_size, 0);
  if (rc < 0) {
    return result;
  }
  result = rb_ary_new();
  rb_ary_push(result, DBL2NUM(to_load_avg(averages[0])));
  rb_ary_push(result, DBL2NUM(to_load_avg(averages[1])));
  rb_ary_push(result, DBL2NUM(to_load_avg(averages[2])));
  return result;
}


void Init_aix_facter_helper() {
    AixFacterHelperModule = rb_define_module("AixFacterHelper");
    rb_define_module_function(AixFacterHelperModule, "getLoadAverages", aixFacterHelper_getLoadAverages, 0);
}


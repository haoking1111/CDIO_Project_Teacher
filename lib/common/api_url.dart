class ApiUrl {
  static const apiUrl ='http://192.168.50.210:8080';
  static const authUrl = '$apiUrl/api/auth/login';
  static const getParentUrl = '$apiUrl/api/user';
  static const getChildUrl = '$apiUrl/api/children/parent';
  static const getClassByIdUrl = '$apiUrl/api/classroom';
  static const getTeacherUrl = '$apiUrl/api/teacher/current';
  static const updateTeacherInfUrl = '$apiUrl/api/user';
  static const getChildInClassUrl = '$apiUrl/api/children/classroom';
  static const getMedicineReminder = '$apiUrl/api/medicine-reminder/children';
}
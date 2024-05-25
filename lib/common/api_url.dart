class ApiUrl {
  static const apiUrl ='http://152.42.238.98:8080';
  static const authUrl = '$apiUrl/api/auth/login';
  static const getParentUrl = '$apiUrl/api/user';
  static const getChildUrl = '$apiUrl/api/children/parent';
  static const getClassByIdUrl = '$apiUrl/api/classroom';
  static const getTeacherUrl = '$apiUrl/api/teacher/current';
  static const updateTeacherInfUrl = '$apiUrl/api/user';
  static const getChildInClassUrl = '$apiUrl/api/children/classroom';
  static const getMedicineReminder = '$apiUrl/api/medicine-reminder/children';
  static const getNotificationUrl = '$apiUrl/api/notification';
  static const getAllMessageUrl = '$apiUrl/api/message';
  static const creatMessageUrl = '$apiUrl/api/message';
  static const postImageUrl = '$apiUrl/api/albums';
  static const getAllCommentForChild = '$apiUrl/api/childComment/child';
  static const creatCommentForChild = '$apiUrl/api/childComment';
  static const getAllPost = '$apiUrl/api/post';
  static const displayAlbumByChildIdUrl = '$apiUrl/api/image';
}
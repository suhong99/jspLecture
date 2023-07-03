package util;

public class BbsUtil {
	
	// 제목이 너무 긴 경우 ...으로 처리하는 함수
	public static String titleDot(String title) {
		String newTitle;
		
		if(title.length() > 40) {
			newTitle = title.trim().substring(0, 40);
			newTitle += "...";
		}else {
			newTitle = title.trim();
		}	
		
		return newTitle;
	}
	
	// 답글의 화살표 표시 함수
	public static String arrow(int depth) {
		String img = "<img src ='./images/arrow.png' width='20px height='20px/>";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		String ts = "";
		// 여백
		for(int i = 0 ; i < depth; i++) {
			ts += nbsp;
		}
		
		return depth == 0?"": ts+img;
	}

}

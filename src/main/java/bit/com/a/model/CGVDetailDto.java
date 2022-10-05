package bit.com.a.model;

public class CGVDetailDto {

	String img;
	String movieAge;
	String movieTitle;
	String nowShow;
	String engTitle;
	String movieRate;
	String detail;
	String story;
	
	public CGVDetailDto(String img, String movieAge, String movieTitle, String nowShow, String engTitle,
			String movieRate, String detail, String story) {
		super();
		this.img = img;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.nowShow = nowShow;
		this.engTitle = engTitle;
		this.movieRate = movieRate;
		this.detail = detail;
		this.story = story;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMovieAge() {
		return movieAge;
	}

	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getNowShow() {
		return nowShow;
	}

	public void setNowShow(String nowShow) {
		this.nowShow = nowShow;
	}

	public String getEngTitle() {
		return engTitle;
	}

	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
	}

	public String getMovieRate() {
		return movieRate;
	}

	public void setMovieRate(String movieRate) {
		this.movieRate = movieRate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	@Override
	public String toString() {
		return "CGVDetailDto [img=" + img + ", movieAge=" + movieAge + ", movieTitle=" + movieTitle + ", nowShow="
				+ nowShow + ", engTitle=" + engTitle + ", movieRate=" + movieRate + ", detail=" + detail + ", story="
				+ story + "]";
	}
}

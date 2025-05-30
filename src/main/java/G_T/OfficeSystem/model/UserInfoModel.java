package G_T.OfficeSystem.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class UserInfoModel {

	private String userId;
	private String password;
	private String email;
	private Timestamp lastlogindate;
	private String registerLink;
	private Timestamp registerLinkTime;
	private Integer type;
	private String profileId;
	private String nickName;
	private String userName;
	private String birthday;
	private Integer sex;
	private String postcode;
	private String address;
	private String tel;
	private String hireDate;
	private String affiliation;
	private String position;
	private String hobby;
	private String specialSkill;
	private String comment;
	private String imageLink;
	private Integer role;
	private String birthday1; // 연도
	private String birthday2; // 월
	private String birthday3; // 일
	private String tel1;
	private String tel2;
	private String tel3;
	private String postcode1;
	private String postcode2;
	private String hireDate1;
	private String hireDate2;
	private String hireDate3;

	public UserInfoModel() {

	}

	public UserInfoModel(
			String userId,
			String password,
			String email,
			Timestamp lastlogindate,
			String registerLink,
			Timestamp registerLinkTime,
			Integer type,
			String nickName,
			String userName,
			String birthday,
			Integer sex,
			String postcode,
			String address,
			String tel,
			String hireDate,
			String affiliation,
			String position,
			String hobby,
			String specialSkill,
			String comment,
			String imageLink) {

		this.userId = userId;
		this.password = password;
		this.email = email;
		this.lastlogindate = lastlogindate;
		this.registerLink = registerLink;
		this.registerLinkTime = registerLinkTime;
		this.type = type;
		this.nickName = nickName;
		this.userName = userName;
		this.birthday = birthday;
		this.sex = sex;
		this.postcode = postcode;
		this.address = address;
		this.tel = tel;
		this.hireDate = hireDate;
		this.affiliation = affiliation;
		this.position = position;
		this.hobby = hobby;
		this.specialSkill = specialSkill;
		this.comment = comment;
		this.imageLink = imageLink;
	}
	public String getHireDate1() { return hireDate1; }
	public void setHireDate1(String hireDate1) { this.hireDate1 = hireDate1; }

	public String getHireDate2() { return hireDate2; }
	public void setHireDate2(String hireDate2) { this.hireDate2 = hireDate2; }

	public String getHireDate3() { return hireDate3; }
	public void setHireDate3(String hireDate3) { this.hireDate3 = hireDate3; }
	public String getPostcode1() {
		return postcode1;
	}
    public void setPostcode1(String postcode1) {
    	this.postcode1 = postcode1;
    }
    public String getPostcode2() {
    	return postcode2;
    }
    public void setPostcode2(String postcode2) {
    	this.postcode2 = postcode2;
    }
	public String getTel1() {
		return birthday1;
	}
    public void setTel1(String tel1) {
    	this.tel1 = tel1;
    }
    public String getTel2() {
    	return tel2;
    }
    public void setTel2(String tel2) {
    	this.tel2 = tel2;
    }
    public String getTel3() {
    	return tel3;
    }
    public void setTel3(String tel3) {
    	this.tel3 = tel3;
    }
	public String getBirthday1() {
		return birthday1;
	}
    public void setBirthday1(String birthday1) {
    	this.birthday1 = birthday1;
    }

    public String getBirthday2() {
    	return birthday2;
    }
    public void setBirthday2(String birthday2) {
    	this.birthday2 = birthday2;
    }

    public String getBirthday3() {
    	return birthday3;
    }
    public void setBirthday3(String birthday3) {
    	this.birthday3 = birthday3;
    }
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getLastlogindate() {
		return lastlogindate;
	}
	public void setLastlogindate(Timestamp lastlogindate) {
		this.lastlogindate = lastlogindate;
	}
	public String getRegisterLink() {
		return registerLink;
	}
	public void setRegisterLink(String registerLink) {
		this.registerLink = registerLink;
	}
	public Timestamp getRegisterLinkTime() {
		return registerLinkTime;
	}
	public void setRegisterLinkTime(Timestamp registerLinkTime) {
		this.registerLinkTime = registerLinkTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getProfileId() {
		return profileId;
	}
	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBirthday() {

		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getAffiliation() {
		return affiliation;
	}
	public void setAffiliation(String affiliation) {
		this.affiliation = affiliation;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSpecialSkill() {
		return specialSkill;
	}
	public void setSpecialSkill(String specialSkill) {
		this.specialSkill = specialSkill;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public String getmergeHireDate() {
		if (hireDate1 != null && hireDate2 != null && hireDate3 != null) {
	        hireDate = hireDate1 + hireDate2 +  hireDate3;
	    }
		return hireDate;
	}

	public void setmergeHireDate(String hireDate) {
	    this.hireDate=hireDate;
	}
	public String getmergePostcode() {
		if(postcode1!=null&&postcode2!=null) {
			postcode=postcode1+postcode2;
		}
		return postcode;
	}
	public void mergePostcode(String postcode) {
		this.postcode=postcode;
	}
	public String getmergeTel() {
		if(tel1!=null&&tel2!=null&&tel3!=null) {
			tel=tel1+tel2+tel3;
		}
		return tel;
	}
	public void setmergeTel(String tel) {
		this.tel=tel;
	}
	// 생년월일을 YYYY-MM-DD 형식으로 변환하는 메서드
    public String getmergeBirthday() {
        if (birthday1 != null && birthday2 != null && birthday3 != null) {
            birthday = birthday1  + birthday2 + birthday3;
        }
        return birthday;
    }
    public void setmergeBirthday(String birthday) {
    	this.birthday=birthday;
    }
	public Integer getYearOld() {
		if (birthday != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			LocalDate birth = LocalDate.parse(birthday, formatter);
			LocalDate today = LocalDate.now();
	        return Period.between(birth, today).getYears();
		}
		else {
			return null;
		}
	}
}

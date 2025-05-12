package G_T.OfficeSystem.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserInfoModelDAO extends JdbcDaoSupport {

	@Autowired
	public UserInfoModelDAO(DataSource dataSource) {
		this.setDataSource(dataSource);
	}


	public Integer CheckUser(LoginModel model) {
		String sql = "select count(*) from user_master where 1 = 1";

		if (model.getUserId() != "") {
			sql += " and USER_ID = '" + model.getUserId() + "'";
		}

		if (model.getPassword() != "") {
			sql += " and PASSWORD = '" + model.getPassword() + "'";
		}

		if (model.getEmail() != "") {
			sql += "and EMAIL = '" + model.getEmail() + "'";
		}

		try {
			return getJdbcTemplate().queryForObject(sql, new Object[] { }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	public List<UserInfoModel> FindUser(FindConditionModel condition) {
		String sql = UserInfoModelMapper.BASE_SQL ;

		if (condition != null) {
			if (condition.getType() != null && !condition.getType().equals("")) {
				sql += " and u.TYPE like '%" + condition.getType() + "%'";
			}


		}

		UserInfoModelMapper mapper = new UserInfoModelMapper();
		try {
			List<UserInfoModel> list = this.getJdbcTemplate().query(sql, mapper);//mapper에 격납
			return list;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	public  void insertUser(UserInfoModel userInfo) {
		String sql1 = "INSERT INTO user_master (USER_ID, PASSWORD, EMAIL) VALUES (?, ?, ?)";
		getJdbcTemplate().update(sql1, userInfo.getUserId(), userInfo.getPassword(), userInfo.getEmail());

		String sql2 = "INSERT INTO profile_info (USER_ID, NICK_NAME, USER_NAME, SEX, BIRTHDAY, TEL, POSTCODE, ADDRESS, HIRE_DATE, AFFILIATION, POSITION, HOBBY, SPECIAL_SKILL, COMMENT) " +
	              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		getJdbcTemplate().update(sql2, userInfo.getUserId(), userInfo.getNickName(), userInfo.getUserName(),userInfo.getSex(),userInfo.getmergeBirthday(),
							 userInfo.getmergeTel(),userInfo.getmergePostcode(), userInfo.getAddress(),
	                         userInfo.getmergeHireDate(), userInfo.getAffiliation(), userInfo.getPosition(), userInfo.getHobby(),
	                         userInfo.getSpecialSkill(), userInfo.getComment());
	}
}

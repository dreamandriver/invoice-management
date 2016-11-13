package cn.riverdream.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TbCheckExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbCheckExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSerialnoIsNull() {
            addCriterion("SERIALNO is null");
            return (Criteria) this;
        }

        public Criteria andSerialnoIsNotNull() {
            addCriterion("SERIALNO is not null");
            return (Criteria) this;
        }

        public Criteria andSerialnoEqualTo(Integer value) {
            addCriterion("SERIALNO =", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoNotEqualTo(Integer value) {
            addCriterion("SERIALNO <>", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoGreaterThan(Integer value) {
            addCriterion("SERIALNO >", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("SERIALNO >=", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoLessThan(Integer value) {
            addCriterion("SERIALNO <", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoLessThanOrEqualTo(Integer value) {
            addCriterion("SERIALNO <=", value, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoIn(List<Integer> values) {
            addCriterion("SERIALNO in", values, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoNotIn(List<Integer> values) {
            addCriterion("SERIALNO not in", values, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoBetween(Integer value1, Integer value2) {
            addCriterion("SERIALNO between", value1, value2, "serialno");
            return (Criteria) this;
        }

        public Criteria andSerialnoNotBetween(Integer value1, Integer value2) {
            addCriterion("SERIALNO not between", value1, value2, "serialno");
            return (Criteria) this;
        }

        public Criteria andChecknoIsNull() {
            addCriterion("CHECKNO is null");
            return (Criteria) this;
        }

        public Criteria andChecknoIsNotNull() {
            addCriterion("CHECKNO is not null");
            return (Criteria) this;
        }

        public Criteria andChecknoEqualTo(String value) {
            addCriterion("CHECKNO =", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoNotEqualTo(String value) {
            addCriterion("CHECKNO <>", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoGreaterThan(String value) {
            addCriterion("CHECKNO >", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoGreaterThanOrEqualTo(String value) {
            addCriterion("CHECKNO >=", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoLessThan(String value) {
            addCriterion("CHECKNO <", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoLessThanOrEqualTo(String value) {
            addCriterion("CHECKNO <=", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoLike(String value) {
            addCriterion("CHECKNO like", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoNotLike(String value) {
            addCriterion("CHECKNO not like", value, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoIn(List<String> values) {
            addCriterion("CHECKNO in", values, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoNotIn(List<String> values) {
            addCriterion("CHECKNO not in", values, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoBetween(String value1, String value2) {
            addCriterion("CHECKNO between", value1, value2, "checkno");
            return (Criteria) this;
        }

        public Criteria andChecknoNotBetween(String value1, String value2) {
            addCriterion("CHECKNO not between", value1, value2, "checkno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoIsNull() {
            addCriterion("CONTRACTSERIALNO is null");
            return (Criteria) this;
        }

        public Criteria andContractserialnoIsNotNull() {
            addCriterion("CONTRACTSERIALNO is not null");
            return (Criteria) this;
        }

        public Criteria andContractserialnoEqualTo(Integer value) {
            addCriterion("CONTRACTSERIALNO =", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoNotEqualTo(Integer value) {
            addCriterion("CONTRACTSERIALNO <>", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoGreaterThan(Integer value) {
            addCriterion("CONTRACTSERIALNO >", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("CONTRACTSERIALNO >=", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoLessThan(Integer value) {
            addCriterion("CONTRACTSERIALNO <", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoLessThanOrEqualTo(Integer value) {
            addCriterion("CONTRACTSERIALNO <=", value, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoIn(List<Integer> values) {
            addCriterion("CONTRACTSERIALNO in", values, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoNotIn(List<Integer> values) {
            addCriterion("CONTRACTSERIALNO not in", values, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoBetween(Integer value1, Integer value2) {
            addCriterion("CONTRACTSERIALNO between", value1, value2, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractserialnoNotBetween(Integer value1, Integer value2) {
            addCriterion("CONTRACTSERIALNO not between", value1, value2, "contractserialno");
            return (Criteria) this;
        }

        public Criteria andContractnoIsNull() {
            addCriterion("CONTRACTNO is null");
            return (Criteria) this;
        }

        public Criteria andContractnoIsNotNull() {
            addCriterion("CONTRACTNO is not null");
            return (Criteria) this;
        }

        public Criteria andContractnoEqualTo(String value) {
            addCriterion("CONTRACTNO =", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoNotEqualTo(String value) {
            addCriterion("CONTRACTNO <>", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoGreaterThan(String value) {
            addCriterion("CONTRACTNO >", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoGreaterThanOrEqualTo(String value) {
            addCriterion("CONTRACTNO >=", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoLessThan(String value) {
            addCriterion("CONTRACTNO <", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoLessThanOrEqualTo(String value) {
            addCriterion("CONTRACTNO <=", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoLike(String value) {
            addCriterion("CONTRACTNO like", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoNotLike(String value) {
            addCriterion("CONTRACTNO not like", value, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoIn(List<String> values) {
            addCriterion("CONTRACTNO in", values, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoNotIn(List<String> values) {
            addCriterion("CONTRACTNO not in", values, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoBetween(String value1, String value2) {
            addCriterion("CONTRACTNO between", value1, value2, "contractno");
            return (Criteria) this;
        }

        public Criteria andContractnoNotBetween(String value1, String value2) {
            addCriterion("CONTRACTNO not between", value1, value2, "contractno");
            return (Criteria) this;
        }

        public Criteria andIncomedateIsNull() {
            addCriterion("INCOMEDATE is null");
            return (Criteria) this;
        }

        public Criteria andIncomedateIsNotNull() {
            addCriterion("INCOMEDATE is not null");
            return (Criteria) this;
        }

        public Criteria andIncomedateEqualTo(Date value) {
            addCriterion("INCOMEDATE =", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateNotEqualTo(Date value) {
            addCriterion("INCOMEDATE <>", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateGreaterThan(Date value) {
            addCriterion("INCOMEDATE >", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateGreaterThanOrEqualTo(Date value) {
            addCriterion("INCOMEDATE >=", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateLessThan(Date value) {
            addCriterion("INCOMEDATE <", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateLessThanOrEqualTo(Date value) {
            addCriterion("INCOMEDATE <=", value, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateIn(List<Date> values) {
            addCriterion("INCOMEDATE in", values, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateNotIn(List<Date> values) {
            addCriterion("INCOMEDATE not in", values, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateBetween(Date value1, Date value2) {
            addCriterion("INCOMEDATE between", value1, value2, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomedateNotBetween(Date value1, Date value2) {
            addCriterion("INCOMEDATE not between", value1, value2, "incomedate");
            return (Criteria) this;
        }

        public Criteria andIncomeamountIsNull() {
            addCriterion("INCOMEAMOUNT is null");
            return (Criteria) this;
        }

        public Criteria andIncomeamountIsNotNull() {
            addCriterion("INCOMEAMOUNT is not null");
            return (Criteria) this;
        }

        public Criteria andIncomeamountEqualTo(Double value) {
            addCriterion("INCOMEAMOUNT =", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountNotEqualTo(Double value) {
            addCriterion("INCOMEAMOUNT <>", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountGreaterThan(Double value) {
            addCriterion("INCOMEAMOUNT >", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountGreaterThanOrEqualTo(Double value) {
            addCriterion("INCOMEAMOUNT >=", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountLessThan(Double value) {
            addCriterion("INCOMEAMOUNT <", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountLessThanOrEqualTo(Double value) {
            addCriterion("INCOMEAMOUNT <=", value, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountIn(List<Double> values) {
            addCriterion("INCOMEAMOUNT in", values, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountNotIn(List<Double> values) {
            addCriterion("INCOMEAMOUNT not in", values, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountBetween(Double value1, Double value2) {
            addCriterion("INCOMEAMOUNT between", value1, value2, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andIncomeamountNotBetween(Double value1, Double value2) {
            addCriterion("INCOMEAMOUNT not between", value1, value2, "incomeamount");
            return (Criteria) this;
        }

        public Criteria andTaxpointIsNull() {
            addCriterion("TAXPOINT is null");
            return (Criteria) this;
        }

        public Criteria andTaxpointIsNotNull() {
            addCriterion("TAXPOINT is not null");
            return (Criteria) this;
        }

        public Criteria andTaxpointEqualTo(Integer value) {
            addCriterion("TAXPOINT =", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointNotEqualTo(Integer value) {
            addCriterion("TAXPOINT <>", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointGreaterThan(Integer value) {
            addCriterion("TAXPOINT >", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointGreaterThanOrEqualTo(Integer value) {
            addCriterion("TAXPOINT >=", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointLessThan(Integer value) {
            addCriterion("TAXPOINT <", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointLessThanOrEqualTo(Integer value) {
            addCriterion("TAXPOINT <=", value, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointIn(List<Integer> values) {
            addCriterion("TAXPOINT in", values, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointNotIn(List<Integer> values) {
            addCriterion("TAXPOINT not in", values, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointBetween(Integer value1, Integer value2) {
            addCriterion("TAXPOINT between", value1, value2, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxpointNotBetween(Integer value1, Integer value2) {
            addCriterion("TAXPOINT not between", value1, value2, "taxpoint");
            return (Criteria) this;
        }

        public Criteria andTaxamountIsNull() {
            addCriterion("TAXAMOUNT is null");
            return (Criteria) this;
        }

        public Criteria andTaxamountIsNotNull() {
            addCriterion("TAXAMOUNT is not null");
            return (Criteria) this;
        }

        public Criteria andTaxamountEqualTo(Double value) {
            addCriterion("TAXAMOUNT =", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountNotEqualTo(Double value) {
            addCriterion("TAXAMOUNT <>", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountGreaterThan(Double value) {
            addCriterion("TAXAMOUNT >", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountGreaterThanOrEqualTo(Double value) {
            addCriterion("TAXAMOUNT >=", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountLessThan(Double value) {
            addCriterion("TAXAMOUNT <", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountLessThanOrEqualTo(Double value) {
            addCriterion("TAXAMOUNT <=", value, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountIn(List<Double> values) {
            addCriterion("TAXAMOUNT in", values, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountNotIn(List<Double> values) {
            addCriterion("TAXAMOUNT not in", values, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountBetween(Double value1, Double value2) {
            addCriterion("TAXAMOUNT between", value1, value2, "taxamount");
            return (Criteria) this;
        }

        public Criteria andTaxamountNotBetween(Double value1, Double value2) {
            addCriterion("TAXAMOUNT not between", value1, value2, "taxamount");
            return (Criteria) this;
        }

        public Criteria andPayamountIsNull() {
            addCriterion("PAYAMOUNT is null");
            return (Criteria) this;
        }

        public Criteria andPayamountIsNotNull() {
            addCriterion("PAYAMOUNT is not null");
            return (Criteria) this;
        }

        public Criteria andPayamountEqualTo(Double value) {
            addCriterion("PAYAMOUNT =", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountNotEqualTo(Double value) {
            addCriterion("PAYAMOUNT <>", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountGreaterThan(Double value) {
            addCriterion("PAYAMOUNT >", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountGreaterThanOrEqualTo(Double value) {
            addCriterion("PAYAMOUNT >=", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountLessThan(Double value) {
            addCriterion("PAYAMOUNT <", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountLessThanOrEqualTo(Double value) {
            addCriterion("PAYAMOUNT <=", value, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountIn(List<Double> values) {
            addCriterion("PAYAMOUNT in", values, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountNotIn(List<Double> values) {
            addCriterion("PAYAMOUNT not in", values, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountBetween(Double value1, Double value2) {
            addCriterion("PAYAMOUNT between", value1, value2, "payamount");
            return (Criteria) this;
        }

        public Criteria andPayamountNotBetween(Double value1, Double value2) {
            addCriterion("PAYAMOUNT not between", value1, value2, "payamount");
            return (Criteria) this;
        }

        public Criteria andPaydateIsNull() {
            addCriterion("PAYDATE is null");
            return (Criteria) this;
        }

        public Criteria andPaydateIsNotNull() {
            addCriterion("PAYDATE is not null");
            return (Criteria) this;
        }

        public Criteria andPaydateEqualTo(Date value) {
            addCriterion("PAYDATE =", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotEqualTo(Date value) {
            addCriterion("PAYDATE <>", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateGreaterThan(Date value) {
            addCriterion("PAYDATE >", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateGreaterThanOrEqualTo(Date value) {
            addCriterion("PAYDATE >=", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateLessThan(Date value) {
            addCriterion("PAYDATE <", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateLessThanOrEqualTo(Date value) {
            addCriterion("PAYDATE <=", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateIn(List<Date> values) {
            addCriterion("PAYDATE in", values, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotIn(List<Date> values) {
            addCriterion("PAYDATE not in", values, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateBetween(Date value1, Date value2) {
            addCriterion("PAYDATE between", value1, value2, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotBetween(Date value1, Date value2) {
            addCriterion("PAYDATE not between", value1, value2, "paydate");
            return (Criteria) this;
        }

        public Criteria andAccountIsNull() {
            addCriterion("ACCOUNT is null");
            return (Criteria) this;
        }

        public Criteria andAccountIsNotNull() {
            addCriterion("ACCOUNT is not null");
            return (Criteria) this;
        }

        public Criteria andAccountEqualTo(Double value) {
            addCriterion("ACCOUNT =", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotEqualTo(Double value) {
            addCriterion("ACCOUNT <>", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountGreaterThan(Double value) {
            addCriterion("ACCOUNT >", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountGreaterThanOrEqualTo(Double value) {
            addCriterion("ACCOUNT >=", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountLessThan(Double value) {
            addCriterion("ACCOUNT <", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountLessThanOrEqualTo(Double value) {
            addCriterion("ACCOUNT <=", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountIn(List<Double> values) {
            addCriterion("ACCOUNT in", values, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotIn(List<Double> values) {
            addCriterion("ACCOUNT not in", values, "account");
            return (Criteria) this;
        }

        public Criteria andAccountBetween(Double value1, Double value2) {
            addCriterion("ACCOUNT between", value1, value2, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotBetween(Double value1, Double value2) {
            addCriterion("ACCOUNT not between", value1, value2, "account");
            return (Criteria) this;
        }

        public Criteria andCompanyIsNull() {
            addCriterion("COMPANY is null");
            return (Criteria) this;
        }

        public Criteria andCompanyIsNotNull() {
            addCriterion("COMPANY is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyEqualTo(String value) {
            addCriterion("COMPANY =", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyNotEqualTo(String value) {
            addCriterion("COMPANY <>", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyGreaterThan(String value) {
            addCriterion("COMPANY >", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyGreaterThanOrEqualTo(String value) {
            addCriterion("COMPANY >=", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyLessThan(String value) {
            addCriterion("COMPANY <", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyLessThanOrEqualTo(String value) {
            addCriterion("COMPANY <=", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyLike(String value) {
            addCriterion("COMPANY like", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyNotLike(String value) {
            addCriterion("COMPANY not like", value, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyIn(List<String> values) {
            addCriterion("COMPANY in", values, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyNotIn(List<String> values) {
            addCriterion("COMPANY not in", values, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyBetween(String value1, String value2) {
            addCriterion("COMPANY between", value1, value2, "company");
            return (Criteria) this;
        }

        public Criteria andCompanyNotBetween(String value1, String value2) {
            addCriterion("COMPANY not between", value1, value2, "company");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("STATUS is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("STATUS =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("STATUS <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("STATUS >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("STATUS >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("STATUS <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("STATUS <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("STATUS in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("STATUS not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("STATUS between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("STATUS not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andConsumerIsNull() {
            addCriterion("CONSUMER is null");
            return (Criteria) this;
        }

        public Criteria andConsumerIsNotNull() {
            addCriterion("CONSUMER is not null");
            return (Criteria) this;
        }

        public Criteria andConsumerEqualTo(String value) {
            addCriterion("CONSUMER =", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerNotEqualTo(String value) {
            addCriterion("CONSUMER <>", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerGreaterThan(String value) {
            addCriterion("CONSUMER >", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerGreaterThanOrEqualTo(String value) {
            addCriterion("CONSUMER >=", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerLessThan(String value) {
            addCriterion("CONSUMER <", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerLessThanOrEqualTo(String value) {
            addCriterion("CONSUMER <=", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerLike(String value) {
            addCriterion("CONSUMER like", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerNotLike(String value) {
            addCriterion("CONSUMER not like", value, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerIn(List<String> values) {
            addCriterion("CONSUMER in", values, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerNotIn(List<String> values) {
            addCriterion("CONSUMER not in", values, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerBetween(String value1, String value2) {
            addCriterion("CONSUMER between", value1, value2, "consumer");
            return (Criteria) this;
        }

        public Criteria andConsumerNotBetween(String value1, String value2) {
            addCriterion("CONSUMER not between", value1, value2, "consumer");
            return (Criteria) this;
        }

        public Criteria andCommentIsNull() {
            addCriterion("COMMENT is null");
            return (Criteria) this;
        }

        public Criteria andCommentIsNotNull() {
            addCriterion("COMMENT is not null");
            return (Criteria) this;
        }

        public Criteria andCommentEqualTo(String value) {
            addCriterion("COMMENT =", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotEqualTo(String value) {
            addCriterion("COMMENT <>", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentGreaterThan(String value) {
            addCriterion("COMMENT >", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentGreaterThanOrEqualTo(String value) {
            addCriterion("COMMENT >=", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLessThan(String value) {
            addCriterion("COMMENT <", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLessThanOrEqualTo(String value) {
            addCriterion("COMMENT <=", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLike(String value) {
            addCriterion("COMMENT like", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotLike(String value) {
            addCriterion("COMMENT not like", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentIn(List<String> values) {
            addCriterion("COMMENT in", values, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotIn(List<String> values) {
            addCriterion("COMMENT not in", values, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentBetween(String value1, String value2) {
            addCriterion("COMMENT between", value1, value2, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotBetween(String value1, String value2) {
            addCriterion("COMMENT not between", value1, value2, "comment");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNull() {
            addCriterion("CREATEDATE is null");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNotNull() {
            addCriterion("CREATEDATE is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedateEqualTo(Date value) {
            addCriterion("CREATEDATE =", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotEqualTo(Date value) {
            addCriterion("CREATEDATE <>", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThan(Date value) {
            addCriterion("CREATEDATE >", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATEDATE >=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThan(Date value) {
            addCriterion("CREATEDATE <", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThanOrEqualTo(Date value) {
            addCriterion("CREATEDATE <=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateIn(List<Date> values) {
            addCriterion("CREATEDATE in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotIn(List<Date> values) {
            addCriterion("CREATEDATE not in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateBetween(Date value1, Date value2) {
            addCriterion("CREATEDATE between", value1, value2, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotBetween(Date value1, Date value2) {
            addCriterion("CREATEDATE not between", value1, value2, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreateuserIsNull() {
            addCriterion("CREATEUSER is null");
            return (Criteria) this;
        }

        public Criteria andCreateuserIsNotNull() {
            addCriterion("CREATEUSER is not null");
            return (Criteria) this;
        }

        public Criteria andCreateuserEqualTo(Integer value) {
            addCriterion("CREATEUSER =", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserNotEqualTo(Integer value) {
            addCriterion("CREATEUSER <>", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserGreaterThan(Integer value) {
            addCriterion("CREATEUSER >", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserGreaterThanOrEqualTo(Integer value) {
            addCriterion("CREATEUSER >=", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserLessThan(Integer value) {
            addCriterion("CREATEUSER <", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserLessThanOrEqualTo(Integer value) {
            addCriterion("CREATEUSER <=", value, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserIn(List<Integer> values) {
            addCriterion("CREATEUSER in", values, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserNotIn(List<Integer> values) {
            addCriterion("CREATEUSER not in", values, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserBetween(Integer value1, Integer value2) {
            addCriterion("CREATEUSER between", value1, value2, "createuser");
            return (Criteria) this;
        }

        public Criteria andCreateuserNotBetween(Integer value1, Integer value2) {
            addCriterion("CREATEUSER not between", value1, value2, "createuser");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
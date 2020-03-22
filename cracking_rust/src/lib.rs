mod leetcode;
mod structures;
mod tasks;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn test_length_of_longest_substring() {
        let s = String::from("pwwkew");
        let res = leetcode::strings::length_of_longest_substring(s);
        assert_eq!(res, 3);
    }

    #[test]
    fn test_empty_transaction_log_zero_size() {
        let log = tasks::transaction_log::TransactionLog::new_empty();
        assert_eq!(log.length, 0);
    }

    #[test]
    fn test_transaction_log() {
        let mut log = tasks::transaction_log::TransactionLog::new_empty();
        log.append(String::from("value1"));
        log.append(String::from("value2"));
        let res1 = log.pop().unwrap();
        assert_eq!(res1, String::from("value1"));
        let res2 = log.pop().unwrap();
        assert_eq!(res2, String::from("value2"));
    }
}

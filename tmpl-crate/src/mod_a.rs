//! `mod_a` library.

pub(crate) mod mod_b;

pub use self::mod_b::sum;

#[cfg(test)]
#[allow(clippy::wildcard_imports)]
mod unit_tests {
    use super::mod_b::*;

    #[test]
    #[ignore]
    #[should_panic]
    fn unit_test_sum() {
        assert_ne!(sum(1, 2), 3);
    }
}

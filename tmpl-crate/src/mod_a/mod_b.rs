//! `mod_b` module.

/// sum two numbers.
///
/// # Examples
/// ```
/// # use tmpl_crate::mod_a::*;
///
/// assert_eq!(sum(1, 2), 3);
/// ```
///
/// ```no_run
/// let a = 1;
/// assert_eq!(a, 1);
/// ```
///
/// ```ignore
/// let a = 1;
/// assert_eq!(a, 1);
/// ```
///
/// ```python
/// import multiprocessing
///
/// print(multiprocessing.cpu_count())
/// ```

pub const fn sum(a: i32, b: i32) -> i32 { private_sum(a, b) }

const fn private_sum(a: i32, b: i32) -> i32 { a + b }

#[cfg(test)]
mod unit_tests {
    use super::*;

    #[test]
    fn unit_test_private_sum() {
        assert_eq!(private_sum(1, 2), 3);
    }
}

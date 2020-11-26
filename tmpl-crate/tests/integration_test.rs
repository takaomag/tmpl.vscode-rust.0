mod common;

use common::{setup, tear_down};
use tmpl_crate::mod_a::*;

#[test]
#[ignore]
#[should_panic]
fn integration_test_sum() {
    setup();
    assert_ne!(sum(1, 2), 3);
    tear_down();
}

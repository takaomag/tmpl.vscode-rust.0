#![warn(
    explicit_outlives_requirements,
    invalid_html_tags,
    macro_use_extern_crate,
    missing_copy_implementations,
    missing_crate_level_docs,
    missing_debug_implementations,
    // missing_doc_code_examples,
    // missing_docs,
    pointer_structural_match,
    private_doc_tests,
    single_use_lifetimes,
    trivial_casts,
    trivial_numeric_casts,
    unreachable_pub,
    // unsafe_op_in_unsafe_fn,
    unused_crate_dependencies,
    unused_extern_crates,
    unused_import_braces,
    unused_lifetimes,
    unused_qualifications,
    unused_results,
    variant_size_differences,
    clippy::pedantic,
    clippy::nursery,
    clippy::cargo,
    clippy::clone_on_ref_ptr,
    clippy::exhaustive_enums,
    clippy::exhaustive_structs,
    clippy::filetype_is_file,
    clippy::float_cmp_const,
    clippy::if_then_some_else_none,
    clippy::lossy_float_literal,
    clippy::rc_buffer,
)]
#![allow(
    // clippy::cognitive_complexity,
    clippy::missing_errors_doc,
    clippy::multiple_crate_versions,
    clippy::must_use_candidate,
)]
// #![rustfmt::skip]
// #![clippy::cognitive_complexity_threshold = "20"]
#![doc(
    html_logo_url = "https://1.bp.blogspot.com/-nD_lpeb1pD8/X4vHKEWXmII/AAAAAAABb2E/Mx07lrXL8qM59wfQM4cKAgwPhoflaKWlACNcBGAsYHQ/s750/nasca_neko.png",
    html_root_url = "https://docs.rs/tmpl-crate/0.1.0",
    // html_no_source,
    test(no_crate_inject, attr(allow(unused_variables), deny(warnings)))
)]

//! A [Rust][Rust] example crate.
//!
//! [Rust]: https://en.wikipedia.org/wiki/Rust_(programming_language)
//!
//!
//! # Examples
//!
//! ```rust
//! assert_eq!(0, 0);
//! ```

#[cfg(doctest)]
#[macro_use]
extern crate doc_comment;
#[cfg(doctest)]
doctest!("../README.md");

// Avoid `unused_crate_dependencies`.
#[cfg(doctest)]
use doc_comment as _;

pub mod mod_a;

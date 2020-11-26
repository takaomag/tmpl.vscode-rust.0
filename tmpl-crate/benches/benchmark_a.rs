use criterion::{black_box, criterion_group, criterion_main, Criterion};
use tmpl_crate::mod_a::*;

pub fn criterion_benchmark(c: &mut Criterion) {
    c.bench_function("sum 20", |b| b.iter(|| sum(black_box(1), black_box(2))));
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);

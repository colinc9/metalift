; ModuleID = 'while4.ll'
source_filename = "while4.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.16.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @test() #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  store i32 0, i32* %tmp, align 4
  store i32 1, i32* %tmp1, align 4
  br label %bb2

bb2:                                              ; preds = %bb5, %bb
  %tmp3 = load i32, i32* %tmp1, align 4
  %tmp4 = icmp slt i32 %tmp3, 3
  br i1 %tmp4, label %bb5, label %bb11

bb5:                                              ; preds = %bb2
  %tmp6 = load i32, i32* %tmp, align 4
  %tmp7 = load i32, i32* %tmp1, align 4
  %tmp8 = add nsw i32 %tmp6, %tmp7
  store i32 %tmp8, i32* %tmp, align 4
  %tmp9 = load i32, i32* %tmp1, align 4
  %tmp10 = add nsw i32 %tmp9, 1
  store i32 %tmp10, i32* %tmp1, align 4
  br label %bb2

bb11:                                             ; preds = %bb2
  %tmp12 = load i32, i32* %tmp, align 4
  ret i32 %tmp12
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 10.0.0 "}

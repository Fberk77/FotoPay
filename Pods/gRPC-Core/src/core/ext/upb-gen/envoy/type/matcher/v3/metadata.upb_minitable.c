/* This file was generated by upb_generator from the input file:
 *
 *     envoy/type/matcher/v3/metadata.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "envoy/type/matcher/v3/metadata.upb_minitable.h"
#include "envoy/type/matcher/v3/value.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"
#include "validate/validate.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub envoy_type_matcher_v3_MetadataMatcher_submsgs[2] = {
  {.UPB_PRIVATE(submsg) = &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init},
  {.UPB_PRIVATE(submsg) = &envoy__type__matcher__v3__ValueMatcher_msg_init},
};

static const upb_MiniTableField envoy_type_matcher_v3_MetadataMatcher__fields[4] = {
  {1, UPB_SIZE(24, 16), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 32), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 40), 64, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 9), 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__type__matcher__v3__MetadataMatcher_msg_init = {
  &envoy_type_matcher_v3_MetadataMatcher_submsgs[0],
  &envoy_type_matcher_v3_MetadataMatcher__fields[0],
  UPB_SIZE(32, 48), 4, kUpb_ExtMode_NonExtendable, 4, UPB_FASTTABLE_MASK(56), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000003f00000a, &upb_pss_1bt},
    {0x002000003f000012, &upb_prm_1bt_max64b},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000900003f000020, &upb_psb1_1bt},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

static const upb_MiniTableField envoy_type_matcher_v3_MetadataMatcher_PathSegment__fields[1] = {
  {1, UPB_SIZE(12, 16), -9, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init = {
  NULL,
  &envoy_type_matcher_v3_MetadataMatcher_PathSegment__fields[0],
  UPB_SIZE(24, 32), 1, kUpb_ExtMode_NonExtendable, 1, UPB_FASTTABLE_MASK(8), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000080100000a, &upb_pos_1bt},
  })
};

static const upb_MiniTable *messages_layout[2] = {
  &envoy__type__matcher__v3__MetadataMatcher_msg_init,
  &envoy__type__matcher__v3__MetadataMatcher__PathSegment_msg_init,
};

const upb_MiniTableFile envoy_type_matcher_v3_metadata_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  2,
  0,
  0,
};

#include "upb/port/undef.inc"


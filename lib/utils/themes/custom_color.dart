import 'package:flutter/material.dart';

const MaterialColor neutral = MaterialColor(_neutralPrimaryValue, <int, Color>{
  10: Color(0xFFFFFFFF),
  20: Color(0xFFE5E7EB),
  30: Color(0xFFD1D5DB),
  40: Color(0xFF9CA3AF),
  50: Color(0xFF6B7280),
  60: Color(0xFF4B5563),
  70: Color(0xFF374151),
  80: Color(0xFF1F2937),
  90: Color(0xFF111827),
  100: Color(_neutralPrimaryValue),
});
const int _neutralPrimaryValue = 0xFF030712;

// ------------------------------------------------------------------------------------------------------------------------------

const MaterialColor primary = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFECFDF5),
  200: Color(0xFFD1FAE5),
  300: Color(_primaryAccentValue),
  400: Color(0xFF047857),
  500: Color(0xFF064E3B),
});
const int _primaryAccentValue = 0xFF10B981;

// ------------------------------------------------------------------------------------------------------------------------------

const MaterialColor error = MaterialColor(_errorAccentValue, <int, Color>{
  100: Color(0xFFFEF2F2),
  200: Color(0xFFFEE2E2),
  300: Color(_errorAccentValue),
  400: Color(0xFFB91C1C),
  500: Color(0xFF7F1D1D),
});
const int _errorAccentValue = 0xFFEF4444;

// ------------------------------------------------------------------------------------------------------------------------------

const MaterialColor warning = MaterialColor(_warningAccentValue, <int, Color>{
  100: Color(0xFFFFF7ED),
  200: Color(0xFFFFEDD5),
  300: Color(_warningAccentValue),
  400: Color(0xFFC2410C),
  500: Color(0xFF7C2D12),
});
const int _warningAccentValue = 0xFFF97316;

// ------------------------------------------------------------------------------------------------------------------------------

const MaterialColor success = MaterialColor(_successAccentValue, <int, Color>{
  100: Color(0xFFF0FDF4),
  200: Color(0xFFDCFCE7),
  300: Color(_successAccentValue),
  400: Color(0xFF15803D),
  500: Color(0xFF14532D),
});
const int _successAccentValue = 0xFF22C55E;

// ------------------------------------------------------------------------------------------------------------------------------

const MaterialColor information =
    MaterialColor(_informationAccentValue, <int, Color>{
  100: Color(0xFFEFF6FF),
  200: Color(0xFFDBEAFE),
  300: Color(_informationAccentValue),
  400: Color(0xFF1D4ED8),
  500: Color(0xFF1E3A8A),
});
const int _informationAccentValue = 0xFF3B82F6;

// ------------------------------------------------------------------------------------------------------------------------------